package com.filipebrandao.busbudchallenge.di

import android.content.Context
import com.filipebrandao.busbudchallenge.api.INetworkLayer
import com.filipebrandao.busbudchallenge.api.NetworkLayer
import com.filipebrandao.busbudchallenge.api.services.IBusbudService
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import com.filipebrandao.busbudchallenge.common.logging.LogcatLogger
import com.filipebrandao.busbudchallenge.domain.repository.departure.DeparturesRepository
import com.filipebrandao.busbudchallenge.domain.repository.departure.IDeparturesRepository
import com.filipebrandao.busbudchallenge.ui.departurelist.DepartureListViewModel
import com.filipebrandao.busbudchallenge.utils.IResourceProvider
import com.filipebrandao.busbudchallenge.utils.ISchedulerProvider
import com.filipebrandao.busbudchallenge.utils.ResourceProvider
import com.filipebrandao.busbudchallenge.utils.SchedulerProvider
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.core.KoinApplication
import org.koin.core.context.startKoin
import org.koin.core.module.Module
import org.koin.dsl.module

/**
 * Defines the Dependency Injection Environment leveraging on the Koin library.
 * Quick Koin reference can be found at https://proandroiddev.com/koin-in-feature-modules-project-6329f069f943
 */
object DependencyInjectionEnvironment {

    private val busbudChallengeModule: Module = module {
        viewModel {
            DepartureListViewModel(
                schedulerProvider = get(),
                departuresRepository = get(),
                resourcesProvider = get(),
                savedStateHandle = get()
            )
        }

        single<IDeparturesRepository> { DeparturesRepository(busbudService = get(), logger = get()) }
    }

    private val networkModule: Module = module {
        single<INetworkLayer> {
            NetworkLayer(
                externalValues = NetworkExternalValues(),
                logger = get()
            )
        }

        single<IBusbudService> {
            val networkLayer: INetworkLayer = get()
            return@single networkLayer.getBusbudService()
        }
    }

    private val utilsModule: Module = module {
        single<ILogger> { LogcatLogger() }
        single<ISchedulerProvider> { SchedulerProvider() }
        single<IResourceProvider> { ResourceProvider(context = androidContext()) }
    }

    private fun getModules(): List<Module> {
        return listOf(
            busbudChallengeModule,
            networkModule,
            utilsModule,
        )
    }

    fun init(context: Context): KoinApplication {
        return startKoin {
            androidContext(context)
            modules(getModules())
        }
    }
}
