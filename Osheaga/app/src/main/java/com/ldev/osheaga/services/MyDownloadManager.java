package com.ldev.osheaga.services;


import android.util.Log;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.persistence.DurationInMillis;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.springandroid.SpringAndroidSpiceRequest;

import org.springframework.web.client.RestTemplate;

public class MyDownloadManager {

    private static String TAG = MyDownloadManager.class.getName();
    private static MySpringAndroidSpiceService spiceServiceClass = new MySpringAndroidSpiceService();
    private static long timestamp ;

    public static boolean sendRequest(SpiceManager spiceManager, SpringAndroidSpiceRequest request, final RequestListener listener)  {


        RestTemplate restTemplate = spiceServiceClass.createRestTemplate();
        request.setRestTemplate(restTemplate);
        // ASYNCHRONOUS CALL
        //    if (listener == null) {
        // Create empty listener
        RequestListener<Object> listenerwrapper= new RequestListener<Object>() {
            @Override
            public void onRequestFailure(SpiceException arg0) {
                listener.onRequestFailure(arg0);
            }

            @Override
            public void onRequestSuccess(Object arg0) {
                long deltaTime = System.currentTimeMillis()- timestamp;
                Log.v("Time query", "Time detla query json=" + deltaTime + " millis");
                listener.onRequestSuccess(arg0);
            }
        };
        //    }

        try {
            timestamp = System.currentTimeMillis();
            spiceManager.execute(request, listenerwrapper);

            return true;
        }catch (Exception e){
            return false;
        }
    }

    public static boolean sendCacheRequest(SpiceManager spiceManager, SpringAndroidSpiceRequest request, RequestListener listener, String cacheKey )  {


        RestTemplate restTemplate = spiceServiceClass.createRestTemplate();
        request.setRestTemplate(restTemplate);
        // ASYNCHRONOUS CALL
        if (listener == null) {
            // Create empty listener
            listener = new RequestListener<Object>() {
                @Override
                public void onRequestFailure(SpiceException arg0) {
                }

                @Override
                public void onRequestSuccess(Object arg0) {
                }
            };
        }

        try {
            spiceManager.execute(request, cacheKey , DurationInMillis.ONE_HOUR, listener);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
