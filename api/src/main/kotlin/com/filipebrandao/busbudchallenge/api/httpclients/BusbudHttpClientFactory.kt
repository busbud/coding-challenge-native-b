package com.filipebrandao.busbudchallenge.api.httpclients

import com.filipebrandao.busbudchallenge.api.IExternalValues
import com.filipebrandao.busbudchallenge.api.endpoints.IBusbudRetrofitServiceDefinition
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import com.filipebrandao.busbudchallenge.common.utils.UUIDAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava3.RxJava3CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory

/**
 * Factory for the service httpclient
 */
class BusbudHttpClientFactory(private val externalValues: IExternalValues, private val logger: ILogger) :
    IHttpClientFactory<IBusbudRetrofitServiceDefinition> {

    companion object {
        private const val TAG = "BusbudHttpClientFactory"
        private const val OK_HTTP_LOG_TAG = "OkHttp"
        private const val OK_HTTP_ACCEPT_KEY = "Accept"
        private const val OK_HTTP_ACCEPT = "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
        private const val HEADER_AUTH_TOKEN = "X-Busbud-Token"
    }


    override fun create(): IBusbudRetrofitServiceDefinition {
        logger.d(TAG, "Creating")

        val httpClient = OkHttpClient.Builder()

        httpClient.addInterceptor(Interceptor { chain ->
            val requestBuilder = chain.request().newBuilder()
            requestBuilder.header(OK_HTTP_ACCEPT_KEY, OK_HTTP_ACCEPT)
            requestBuilder.header(HEADER_AUTH_TOKEN, externalValues.getAuthToken())
            chain.proceed(requestBuilder.build())
        })

        HttpLoggingInterceptor { message ->
            // log through our own Logger
            logger.d(OK_HTTP_LOG_TAG, message)
        }.apply {
            this.level = HttpLoggingInterceptor.Level.BODY
            httpClient.addInterceptor(this)
        }

        val moshi = Moshi.Builder()
            .add(UUIDAdapter())
            .addLast(KotlinJsonAdapterFactory())
            .build()

        val retrofit = Retrofit.Builder()
            .addCallAdapterFactory(RxJava3CallAdapterFactory.create())
            .addConverterFactory(MoshiConverterFactory.create(moshi))
            .baseUrl(externalValues.getBaseUrl())
            .client(httpClient.build()).build()

        return retrofit.create(IBusbudRetrofitServiceDefinition::class.java)
    }
}
