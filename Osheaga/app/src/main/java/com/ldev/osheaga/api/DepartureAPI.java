package com.ldev.osheaga.api;


import android.content.Context;
import android.util.Log;

import com.ldev.osheaga.model.DataManager;
import com.ldev.osheaga.model.Departure;
import com.ldev.osheaga.model.PollDeparture;
import com.ldev.osheaga.services.DataRequestJson;
import com.ldev.osheaga.services.MyDownloadManager;
import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;

public class DepartureAPI {

    private static String TAG = DepartureAPI.class.getName();

    public static void getDeparturesPool(Context context, SpiceManager spiceManager, final RequestListener<PollDeparture> requestListener, int nbAdult, int nbChild, int nbSenior, String lang, String currency, int index) {

        String url = DataManager.API_DEPARTURES_URL_POOL;

        url += "?adult=" + nbAdult + "&child=" + nbChild + "&senior=" + nbSenior + "&lang=" + lang + "&currency=" + currency + "&index=" + index;


        Log.v(TAG, " url call=" + url);

        RequestListener<Object> wrapperRequestListener = new RequestListener<Object>() {
            @Override
            public void onRequestFailure(SpiceException spiceException) {
                Log.e(TAG, "onRequestFailure: Fail to get PollDeparture", spiceException);
                requestListener.onRequestFailure(spiceException);
            }

            @Override
            public void onRequestSuccess(Object object) {
                if (object == null) {
                    Log.e(TAG, "onRequestSuccess: no PollDeparture, return" );
                    return;
                }

                if (object instanceof PollDeparture) {
                    Log.d(TAG, "onRequestSuccess: PollDeparture");
                    PollDeparture departure = (PollDeparture) object;
                    requestListener.onRequestSuccess(departure);
                } else {
                    Log.e(TAG, "onRequestSuccess: object is not instance of PollDeparture");
                }
            }
        };

        DataRequestJson<PollDeparture> dataRequestJson = new DataRequestJson(PollDeparture.class, url);
        String cacheKey = TAG + ":getDeparturesPool";

        MyDownloadManager.sendRequest(spiceManager, dataRequestJson, wrapperRequestListener);
    }

    public static void getDepartures(Context context, SpiceManager spiceManager, final RequestListener<Departure> requestListener, int nbAdult, int nbChild, int nbSenior, String lang, String currency) {

        String url = DataManager.API_DEPARTURES_URL;

        //TODO make validation with the rules of the compagny.
        url += "?adult=" + nbAdult + "&child=" + nbChild + "&senior=" + nbSenior + "&lang=" + lang + "&currency=" + currency;


        Log.v(TAG, " url call=" + url);

        RequestListener<Object> wrapperRequestListener = new RequestListener<Object>() {
            @Override
            public void onRequestFailure(SpiceException spiceException) {
                Log.e(TAG, "Fail to get Departures, " + spiceException);
                requestListener.onRequestFailure(spiceException);
            }

            @Override
            public void onRequestSuccess(Object object) {
                if (object == null) {
                    Log.e(TAG, "no Departures");
                    return;
                }

                if (object instanceof Departure) {
                    Log.d(TAG, "onRequestSuccess: departure");
                    Departure departure = (Departure) object;
                    requestListener.onRequestSuccess(departure);
                } else {
                    Log.e(TAG, "onRequestSuccess: object is not instance of Departure");
                }
            }
        };

        DataRequestJson<Departure> dataRequestJson = new DataRequestJson(Departure.class, url);
        String cacheKey = TAG + ":getDepartures";

        MyDownloadManager.sendRequest(spiceManager, dataRequestJson, wrapperRequestListener);
    }
}
