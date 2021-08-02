package com.filipebrandao.busbudchallenge.api

import com.filipebrandao.busbudchallenge.api.httpclients.BusbudHttpClientFactory
import com.filipebrandao.busbudchallenge.api.services.BusbudService
import com.filipebrandao.busbudchallenge.api.services.IBusbudService
import com.filipebrandao.busbudchallenge.common.logging.ILogger

/**
 * Facade for the Network Layer
 */
class NetworkLayer(externalValues: IExternalValues, logger: ILogger) : INetworkLayer {

    private val busbudServiceInstance: IBusbudService by lazy {
        BusbudService(BusbudHttpClientFactory(externalValues, logger))
    }

    override fun getBusbudService(): IBusbudService {
        return busbudServiceInstance
    }
}
