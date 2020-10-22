package com.ruimendes.busbud.di

import android.content.Context
import com.ruimendes.busbud.configs.NetworkConfigs
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityComponent
import dagger.hilt.android.qualifiers.ActivityContext
import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.adapter.rxjava3.RxJava3CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory
import java.io.File

@Module
@InstallIn(ActivityComponent::class)
object NetworkModule {

   @Provides
   fun provideRetrofit(okHttpClient: OkHttpClient): Retrofit {
       return Retrofit.Builder()
           .client(okHttpClient)
           .addConverterFactory(MoshiConverterFactory.create())
           .addCallAdapterFactory(RxJava3CallAdapterFactory.create())
           .build()
   }

    @Provides
    fun provideOkHttp(cache: Cache): OkHttpClient {
        return OkHttpClient.Builder().cache(cache).build()
    }

    @Provides
    fun provideCache(@ActivityContext context: Context): Cache? {
        val cacheDir = File(context.cacheDir, NetworkConfigs.CACHE_DIR_HTTP)
        return Cache(cacheDir, NetworkConfigs.CACHE_SIZE_HTTP)
    }
}