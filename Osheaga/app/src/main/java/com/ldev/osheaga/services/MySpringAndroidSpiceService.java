package com.ldev.osheaga.services;


import android.app.Application;
import com.octo.android.robospice.SpringAndroidSpiceService;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.springandroid.json.jackson2.Jackson2ObjectPersisterFactory;

import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.util.List;

public class MySpringAndroidSpiceService extends SpringAndroidSpiceService {

    @Override
    public CacheManager createCacheManager(Application application) throws CacheCreationException {
        CacheManager cacheManager = new CacheManager();
        Jackson2ObjectPersisterFactory inJSonFileObjectPersisterFactory = new Jackson2ObjectPersisterFactory(application);

        inJSonFileObjectPersisterFactory.setAsyncSaveEnabled(true);

        cacheManager.addPersister(inJSonFileObjectPersisterFactory);
        return cacheManager;
    }

    @Override
    public RestTemplate createRestTemplate() {


        RestTemplate restTemplate = new RestTemplate() ;


        // Set Converters
        final MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
        FormHttpMessageConverter formHttpMessageConverter = new FormHttpMessageConverter();
        StringHttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter();
        final List<HttpMessageConverter<?>> listHttpMessageConverters = restTemplate.getMessageConverters();


        listHttpMessageConverters.add(jsonConverter);
        listHttpMessageConverters.add( formHttpMessageConverter );
        listHttpMessageConverters.add( stringHttpMessageConverter );
        restTemplate.setMessageConverters(listHttpMessageConverters);
        return restTemplate;
    }
}