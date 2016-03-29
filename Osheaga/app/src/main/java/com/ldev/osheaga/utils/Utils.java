package com.ldev.osheaga.utils;


import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Date;
import java.util.Locale;

public class Utils {

    /**
     * Format money with the  Currency
     * @param total
     * @param currency
     * @return
     */
    public static String formatTotalWithCurrency(int total, Currency currency) {

        int fractionDigits = currency.getDefaultFractionDigits();
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMinimumFractionDigits(fractionDigits);
        double totalFloat = (total / (10 * fractionDigits));
        return nf.format(totalFloat) + "" + currency.getSymbol();

    }

    /**
     * Methode that verify if the time in string is before the hour and min that is in parameter.
     * @param dateTime
     * @param hour
     * @param min
     * @return
     */
    public static boolean ifTimeBefore(@NonNull String dateTime, int hour, int min) {
        String timeString = getTimeFromDate(dateTime);
        try {
            String[] times = timeString.split(":");
            int hour1 = Integer.parseInt(times[0]);
            int min1 = Integer.parseInt(times[1]);
            if (hour1 <= hour) {
                if (hour1 == hour) {
                    return min1 <= min;
                }
                return true;
            }
        }catch (Exception e){
            return false;
        }
        return false;
    }

    /**
     * Return the time in HH:mm from the String date
     * @param dateStr
     * @return
     */
    public static String getTimeFromDate(String dateStr) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.getDefault());
        SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm", Locale.getDefault());
        try {
            Date date = sdf.parse(dateStr);
            return sdfTime.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * ImageLoader fonction
     *
     * @param url
     * @param imageView
     */
    public static void downloadImage(String url, final ImageView imageView) {
        downloadImage(url, imageView, 0, false);
    }

    public static void downloadImage(String url, final ImageView imageView, boolean notUseCache) {
        downloadImage(url, imageView, 0, notUseCache);
    }

    public static void downloadImage(String url, final ImageView imageView, int defaultImage) {
        downloadImage(url, imageView, defaultImage, false);
    }

    public static void downloadImage(final String url, final ImageView imageView, final int placeHolderRes, boolean notUseCache, final boolean enableLog) {
        if (url != null && url.length() > 0) {

            if (enableLog) {
                Log.v("DOWNLOADIDMAGE", "DOWNLOAD IMAGE:" + url);
            }


            if (notUseCache) {
                clearCacheUrl(url);
            }

            ImageLoader.getInstance().displayImage(url, imageView, new SimpleImageLoadingListener() {
                @Override
                public void onLoadingComplete(String imageUri, View view, Bitmap loadedImage) {
                    if (enableLog) {
                        Log.e("DOWNLOADIDMAGE", "setImage:" + imageUri + " imageViewId=" + imageView.getId());
                    }

                    super.onLoadingComplete(imageUri, view, loadedImage);
                }

                @Override
                public void onLoadingCancelled(String imageUri, View view) {
                    if (enableLog) {
                        Log.e("DOWNLOADIDMAGE", "onLoadingCancelled:" + imageUri + " imageViewId=" + imageView.getId());
                    }
                    super.onLoadingCancelled(imageUri, view);
                }

                @Override
                public void onLoadingFailed(String imageUri, View view, FailReason failReason) {
                    super.onLoadingFailed(imageUri, view, failReason);
                    if (enableLog) {
                        Log.e("DOWNLOADIDMAGE", "loadingFailed, imageUri=" + imageUri + " fail reason=" + failReason);
                    }
                    imageView.setImageResource(placeHolderRes);
                }
            });

        } else {
            imageView.setImageResource(placeHolderRes);
        }
    }

    public static void downloadImage(final String url, final ImageView imageView, final int placeHolderRes, boolean notUseCache) {
        downloadImage(url, imageView, placeHolderRes, notUseCache, false);
    }


    /**
     * Parse the url to remove image from all format from the cache
     *
     * @param url
     */
    public static void clearCacheUrl(String url) {
        MemoryCacheUtils.removeFromCache(url, ImageLoader.getInstance().getMemoryCache());
    }
}
