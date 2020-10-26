package com.ruimendes.busbud.di

import android.content.Context
import com.ruimendes.busbud.wrapper.platform.PlatformResources
import com.ruimendes.busbud.wrapper.platform.ResourcesInterface
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ApplicationComponent
import dagger.hilt.android.qualifiers.ApplicationContext

@Module
@InstallIn(ApplicationComponent::class)
object ResourcesModule {
    @Provides
    fun providesResources(@ApplicationContext context: Context): ResourcesInterface {
        return PlatformResources(context)
    }
}