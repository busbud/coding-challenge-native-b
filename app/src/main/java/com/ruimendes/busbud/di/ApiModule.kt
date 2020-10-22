package com.ruimendes.busbud.di

import com.ruimendes.busbud.api.BusBudApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityComponent
import dagger.hilt.android.components.ApplicationComponent
import retrofit2.Retrofit

@Module
@InstallIn(ApplicationComponent::class)
object ApiModule {

    @Provides
    fun provideBusBudApi(retrofit: Retrofit): BusBudApi {
        return retrofit.create(BusBudApi::class.java)
    }
}