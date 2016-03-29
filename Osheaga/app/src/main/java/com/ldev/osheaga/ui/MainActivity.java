package com.ldev.osheaga.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;

import com.ldev.osheaga.R;
import com.ldev.osheaga.api.DepartureAPI;
import com.ldev.osheaga.model.DataManager;
import com.ldev.osheaga.model.Departure;
import com.ldev.osheaga.model.Operator;
import com.ldev.osheaga.model.PollDeparture;
import com.ldev.osheaga.model.XDeparture;
import com.ldev.osheaga.ui.adapter.DepartureAdapter;
import com.ldev.osheaga.utils.Utils;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;

import java.util.ArrayList;
import java.util.Iterator;

public class MainActivity extends AppCompatActivity  implements MessageView.MessageViewInterface{

    private static String TAG = MainActivity.class.getName();

    private static int REQUEST_CODE = 1;

    public RecyclerView recyclerView;
    private DepartureAdapter adapter;
    private RecyclerView.LayoutManager layoutManager;
    private  MessageView messageView;


    private Departure departure;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        recyclerView = (RecyclerView) findViewById(R.id.rvDepartures);
        recyclerView.setHasFixedSize(true);

        messageView = (MessageView) findViewById(R.id.messageView);
        messageView.setMessageViewInterface(this);
        messageView.setMessageInformation(getString(R.string.message_view_information));
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = SearchActivity.newIntent(MainActivity.this);
                startActivityForResult(intent, REQUEST_CODE);
            }
        });

        downloadDeparture();
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                int hour = data.getIntExtra(SearchActivity.EXTRA_HOUR, 0);
                int min = data.getIntExtra(SearchActivity.EXTRA_MIN, 0);
                ArrayList<XDeparture> XDepartures =  (ArrayList<XDeparture> )DataManager.getInstance().getDeparture().getDepartures().clone();
                removeDepartureUnderXtime(hour, min, XDepartures);
                adapter.setDepartures(XDepartures);
            }
        }
    }

    private void updateView() {
        if (departure != null) {
            Log.i(TAG, "updateView: departurelist=" + departure.getDepartures().size());
            adapter = new DepartureAdapter(this, departure);
            recyclerView.setAdapter(adapter);
        }
    }


    @Override
    protected void onStart() {
        super.onStart();
        DataManager.getInstance().startSpiceManager(this);
    }

    @Override
    protected void onStop() {
        super.onStop();
        DataManager.getInstance().stopSpiceManager();
    }

    private void downloadDeparture() {
        messageView.showProgressBar();
        DepartureAPI.getDepartures(this, DataManager.getInstance().getSpiceManager(), requestListener, 1, 0, 0, DataManager.getInstance().getLang(), DataManager.getInstance().getCurrencyString());
    }

    private void pollDeparture(int index) {
        Log.i(TAG, "pollDeparture: index=" + index);
        DepartureAPI.getDeparturesPool(this, DataManager.getInstance().getSpiceManager(), requestListenerPollDeparture, 1, 0, 0, DataManager.getInstance().getLang(), DataManager.getInstance().getCurrencyString(), index);
    }


    private RequestListener<Departure> requestListener = new RequestListener<Departure>() {
        @Override
        public void onRequestFailure(SpiceException spiceException) {
            Log.e(TAG, "onRequestFailure: spiceException=", spiceException);
            messageView.setMessageError(getString(R.string.default_error_message));
        }

        @Override
        public void onRequestSuccess(Departure departureResult) {
            Log.i(TAG, "onRequestSuccess: Departure departure=" + departureResult);
            departure = departureResult;
            DataManager.getInstance().setDeparture(departure);
            MessageView.hideLoadingView(messageView);
            updateView();
            Log.i(TAG, "onRequestSuccess: Departure isComplete=" + departure.isComplete());

            if (!departure.isComplete()) {
                pollDeparture(departure.getDepartures().size());
            }

        }
    };

    private RequestListener<PollDeparture> requestListenerPollDeparture = new RequestListener<PollDeparture>() {
        @Override
        public void onRequestFailure(SpiceException spiceException) {
            messageView.setMessageError(getString(R.string.default_error_message));
            Log.e(TAG, "onRequestFailure: PollDeparture spiceException=", spiceException);
        }

        @Override
        public void onRequestSuccess(PollDeparture pollDepartureResult) {
            Log.i(TAG, "onRequestSuccess: PollDeparture=" + pollDepartureResult);

            if (departure != null) {
                ArrayList<XDeparture> departures = departure.getDepartures();
                ArrayList<Operator> operators = departure.getOperators();
                departures.addAll(pollDepartureResult.getDepartures());
                operators.addAll(pollDepartureResult.getOperators());
                departure.setDepartures(departures);
                departure.setOperators(operators);
                DataManager.getInstance().setDeparture(departure);
            }
            Log.i(TAG, "onRequestSuccess: PollDeparture isComplete=" + pollDepartureResult.isComplete());

            updateView();

            if (!pollDepartureResult.isComplete()) {
                pollDeparture(departure.getDepartures().size());
            }
        }
    };

    /**
     * Fonction that remove bus that is after the selected hour and time
     * @param hour
     * @param minute
     * @param xDepartures
     */
    private void removeDepartureUnderXtime(int hour, int minute, ArrayList<XDeparture> xDepartures) {
        Iterator<XDeparture> i = xDepartures.iterator();
        while (i.hasNext()) {
            XDeparture xDeparture = i.next();
            if (!Utils.ifTimeBefore(xDeparture.getArrivalTime(), hour, minute)) {
                i.remove();
            }
        }
    }

    @Override
    public void retry() {
        messageView.setMessageInformation(getString(R.string.message_view_information));
        downloadDeparture();
    }
}
