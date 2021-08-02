package com.filipebrandao.busbudchallenge.api

import com.filipebrandao.busbudchallenge.api.services.IBusbudService

/**
 * Interface for the NetworkModule's facade
 */
interface INetworkLayer {
    fun getBusbudService(): IBusbudService
}
