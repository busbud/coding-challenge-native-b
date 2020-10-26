package com.ruimendes.busbud.di

import com.ruimendes.busbud.wrapper.formatters.NumberFormatter
import com.ruimendes.busbud.wrapper.formatters.NumberFormatterInterface
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ApplicationComponent

@Module
@InstallIn(ApplicationComponent::class)
object FormatterModule {

    @Provides
    fun providesNumberFormatter(): NumberFormatterInterface {
        return NumberFormatter()
    }
}