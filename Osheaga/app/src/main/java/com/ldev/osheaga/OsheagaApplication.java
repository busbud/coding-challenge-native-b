package com.ldev.osheaga;

import android.app.Application;

import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;


public class OsheagaApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        //Initialize image loader
        DisplayImageOptions defaultOption = new DisplayImageOptions.Builder()
                .cacheInMemory(true)
                .cacheOnDisk(true)
                .build();

        ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(this)
                .defaultDisplayImageOptions(defaultOption)
                .build();

        ImageLoader.getInstance().init(config);
    }
}
