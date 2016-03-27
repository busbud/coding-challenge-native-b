package com.ldev.osheaga.ui;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;

import com.ldev.osheaga.R;
import com.ldev.osheaga.api.DepartureAPI;
import com.ldev.osheaga.model.DataManager;
import com.ldev.osheaga.model.Departure;
import com.ldev.osheaga.model.Operator;
import com.ldev.osheaga.model.PollDeparture;
import com.ldev.osheaga.model.XDeparture;
import com.ldev.osheaga.ui.adapter.DepartureAdapter;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;

import java.util.ArrayList;

import butterknife.Bind;

public class MainActivity extends AppCompatActivity {

    private static String TAG = MainActivity.class.getName();

    public RecyclerView recyclerView;
    private RecyclerView.Adapter adapter;
    private RecyclerView.LayoutManager layoutManager;

    private Departure departure;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        recyclerView = (RecyclerView) findViewById(R.id.rvDepartures);
        recyclerView.setHasFixedSize(true);
        layoutManager =  new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });

        downloadDeparture();
    }


    private void updateView(){
        if( departure !=null){
            Log.i(TAG, "updateView: departurelist="+departure.getDepartures().size());
            adapter = new DepartureAdapter(this, departure);
            recyclerView.setAdapter(adapter);
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            Intent intent = SettingsActivity.newIntent(this);
            startActivity(intent);
            return true;
        }

        return super.onOptionsItemSelected(item);
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
        DepartureAPI.getDepartures(this, DataManager.getInstance().getSpiceManager(), requestListener, 1, 0, 0, DataManager.getInstance().getLang(), DataManager.getInstance().getCurrencyString());
    }

    private void pollDeparture(int index){
        Log.i(TAG, "pollDeparture: index="+index);
        DepartureAPI.getDeparturesPool(this,DataManager.getInstance().getSpiceManager(), requestListenerPollDeparture, 1, 0, 0, DataManager.getInstance().getLang(), DataManager.getInstance().getCurrencyString(), index);
    }


    private RequestListener<Departure> requestListener = new RequestListener<Departure>() {
        @Override
        public void onRequestFailure(SpiceException spiceException) {
            Log.e(TAG, "onRequestFailure: spiceException=", spiceException);
        }

        @Override
        public void onRequestSuccess(Departure departureResult) {
            Log.i(TAG, "onRequestSuccess: Departure departure=" + departureResult);
            departure = departureResult;
            updateView();
            Log.i(TAG, "onRequestSuccess: Departure isComplete=" + departure.isComplete());

            if(!departure.isComplete()){
                pollDeparture(departure.getTtl());
            }


        }
    };

    private RequestListener<PollDeparture> requestListenerPollDeparture = new RequestListener<PollDeparture>() {
        @Override
        public void onRequestFailure(SpiceException spiceException) {
            Log.e(TAG, "onRequestFailure: PollDeparture spiceException=", spiceException);
        }

        @Override
        public void onRequestSuccess(PollDeparture pollDepartureResult) {
            Log.i(TAG, "onRequestSuccess: PollDeparture=" + pollDepartureResult);

            if(departure !=null){
                ArrayList<XDeparture> departures = departure.getDepartures();
                ArrayList<Operator> operators = departure.getOperators();

                departures.addAll(pollDepartureResult.getDepartures());
                operators.addAll(pollDepartureResult.getOperators());
                departure.setDepartures(departures);
                departure.setOperators(operators);
            }
            Log.i(TAG, "onRequestSuccess: PollDeparture isComplete=" + pollDepartureResult.isComplete());
            updateView();

            if(!pollDepartureResult.isComplete()){
                pollDeparture(pollDepartureResult.getTtl());
            }
        }
    };
}
