package com.ldev.osheaga.model;

import android.content.Context;

import com.ldev.osheaga.BuildConfig;
import com.ldev.osheaga.services.MySpringAndroidSpiceService;
import com.octo.android.robospice.SpiceManager;

import java.util.Currency;
import java.util.Locale;

public class DataManager {

    private static String NEW_YORK_GOEHASH = "dr5reg";
    private static String MONTREAL_GOEHASH = "f25dvk";
    private static String DATE = "2016-07-29";

    public static String API_DEPARTURES_URL = BuildConfig.SERVER + "/x-departures/" + NEW_YORK_GOEHASH + "/" + MONTREAL_GOEHASH + "/" + DATE;
    public static String API_DEPARTURES_URL_POOL = API_DEPARTURES_URL+"/poll";

    private static DataManager instance;



    private SpiceManager spiceManager;
    private String lang;
    private Currency currency;

    private DataManager() {
        spiceManager = new SpiceManager(MySpringAndroidSpiceService.class);
        lang = Locale.getDefault().getCountry();
        currency = Currency.getInstance(Locale.getDefault());
                Currency.getInstance(Locale.getDefault()).toString();

    }
    public static DataManager getInstance() {
        if (instance == null) {
            instance = new DataManager();
        }
        return instance;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }
    public String getLang() {
        return lang;
    }

    public String getCurrencyString() {
        return currency.toString();
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }


    public SpiceManager getSpiceManager(){
        return spiceManager;
    }

    public void startSpiceManager(Context context){
        if(!spiceManager.isStarted())
            spiceManager.start(context);
    }

    public void stopSpiceManager(){
        if(spiceManager.isStarted())
            spiceManager.shouldStop();
    }
}
