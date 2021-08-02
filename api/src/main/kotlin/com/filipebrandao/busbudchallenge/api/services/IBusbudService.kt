package com.filipebrandao.busbudchallenge.api.services

import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import io.reactivex.rxjava3.core.Single

/**
 * Interface for the remote Busbud API service
 */
interface IBusbudService {

    /**
     * Search departures
     */
    fun search(originGeohash: String, destinationGeohash: String, outboundDate: String, adults: Int): Single<SearchResponseDto>

    /**
     * Poll more departure after a search request
     */
    fun poll(originGeohash: String, destinationGeohash: String, outboundDate: String, adults: Int, index: Int): Single<PollResponseDto>
}