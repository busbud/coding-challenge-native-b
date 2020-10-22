package com.ruimendes.busbud.di

import com.ruimendes.busbud.api.BusBudApi
import com.ruimendes.busbud.repository.SearchRepository
import com.ruimendes.busbud.repository.SearchRepositoryInterface
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ActivityComponent

@Module
@InstallIn(ActivityComponent::class)
object SearchModule {

    @Provides
    fun provideSearchRepository(busBudApi: BusBudApi): SearchRepositoryInterface {
        return SearchRepository(busBudApi)
    }
    
}