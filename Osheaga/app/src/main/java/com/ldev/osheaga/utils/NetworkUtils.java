package com.ldev.osheaga.utils;


import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import com.octo.android.robospice.exception.NetworkException;
import com.octo.android.robospice.persistence.exception.SpiceException;

import org.springframework.http.HttpStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;

public class NetworkUtils {

    public static boolean isNetworkAvailable(Context context) {
        final ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        final NetworkInfo networkInfo = cm.getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isConnected();
    }


    public static boolean isNetworkAvailableByWifi(Context context) {
        final ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        final NetworkInfo networkInfo = cm.getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isConnected() && networkInfo.getType() == ConnectivityManager.TYPE_WIFI;
    }


    public static int getNetworkConnectedType(Context context) {
        final ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        final NetworkInfo networkInfo = cm.getActiveNetworkInfo();

        if (networkInfo != null && networkInfo.isConnected()) {
            return networkInfo.getType();
        }
        return -1;
    }


    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // //
    // // NETWORK ERROR
    // //
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public static boolean is401HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.UNAUTHORIZED);
    }

    public static boolean is403HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.FORBIDDEN);
    }

    public static boolean is404HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.NOT_FOUND);
    }

    public static boolean is406HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.NOT_ACCEPTABLE);
    }

    public static boolean is408HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.REQUEST_TIMEOUT);
    }

    public static boolean is429HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode() == HttpStatus.TOO_MANY_REQUESTS);
    }


    public static boolean is409HTTPError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode().value() == org.apache.http.HttpStatus.SC_CONFLICT);
    }

    public static boolean is500HttpError(SpiceException e) {
        boolean resp = false;
        if (e instanceof NetworkException) {
            if (e.getCause() instanceof HttpClientErrorException) {
                resp = (((HttpClientErrorException) e.getCause()).getStatusCode().value() == org.apache.http.HttpStatus.SC_INTERNAL_SERVER_ERROR);
            } else if (e.getCause() instanceof org.springframework.web.client.HttpServerErrorException) {
                resp = (((org.springframework.web.client.HttpServerErrorException) e.getCause()).getStatusCode() == HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
        return resp;
    }

    public static boolean is503HttpError(SpiceException e) {
        boolean resp = false;
        if (e instanceof NetworkException) {
            if (e.getCause() instanceof HttpClientErrorException) {
                resp = (((HttpClientErrorException) e.getCause()).getStatusCode().value() == org.apache.http.HttpStatus.SC_SERVICE_UNAVAILABLE);
            } else if (e.getCause() instanceof org.springframework.web.client.HttpServerErrorException) {
                resp = (((org.springframework.web.client.HttpServerErrorException) e.getCause()).getStatusCode() == org.springframework.http.HttpStatus.SERVICE_UNAVAILABLE);
            }
        }
        return resp;
    }

    public static boolean is422HttpError(SpiceException e) {
        return (e instanceof NetworkException
                && e.getCause() instanceof HttpClientErrorException
                && ((HttpClientErrorException) e.getCause()).getStatusCode().value() == org.apache.http.HttpStatus.SC_UNPROCESSABLE_ENTITY);
    }

    public static boolean isAccessException(SpiceException e) {
        return (e instanceof NetworkException)
                && e.getCause() instanceof ResourceAccessException;
    }






}
