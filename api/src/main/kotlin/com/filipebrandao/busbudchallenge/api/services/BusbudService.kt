package com.filipebrandao.busbudchallenge.api.services

import com.filipebrandao.busbudchallenge.api.endpoints.IBusbudRetrofitServiceDefinition
import com.filipebrandao.busbudchallenge.api.httpclients.IHttpClientFactory

/**
 * Implementation for [IBusbudService] based on Retrofit
 */
class BusbudService(httpClientFactory: IHttpClientFactory<IBusbudRetrofitServiceDefinition>) : IBusbudService {

    val api: IBusbudRetrofitServiceDefinition by lazy { httpClientFactory.create() }

    override fun search(originGeohash: String, destinationGeohash: String, outboundDate: String, adults: Int) = api.search(originGeohash, destinationGeohash, outboundDate, adults)

    override fun poll(originGeohash: String, destinationGeohash: String, outboundDate: String, adults: Int, index: Int) = api.poll(originGeohash, destinationGeohash, outboundDate, adults, index)
}
