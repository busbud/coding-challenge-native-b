package com.filipebrandao.busbudchallenge.api.endpoints

import com.filipebrandao.busbudchallenge.api.models.responses.PollResponseDto
import com.filipebrandao.busbudchallenge.api.models.responses.SearchResponseDto
import io.reactivex.rxjava3.core.Single
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

/**
 * Defines the Retrofit interface for the Busbud api
 */
interface IBusbudRetrofitServiceDefinition {

    companion object {
        private const val PATH_ORIGIN = "origin"
        private const val PATH_DESTINATION = "destination"
        private const val PATH_OUTBOUND_DATE = "outboundDate"

        private const val QUERY_ADULT = "adult"
        private const val QUERY_INDEX = "index"

        private const val SEARCH_ENDPOINT_PATH = "x-departures/{${PATH_ORIGIN}}/{${PATH_DESTINATION}}/{${PATH_OUTBOUND_DATE}}"
        private const val POLL_ENDPOINT_PATH = "${SEARCH_ENDPOINT_PATH}/poll"
    }

    @GET(SEARCH_ENDPOINT_PATH)
    fun search(
        @Path(PATH_ORIGIN) origin: String,
        @Path(PATH_DESTINATION) destination: String,
        @Path(PATH_OUTBOUND_DATE) outboundDate: String,
        @Query(QUERY_ADULT) adults: Int
    ): Single<SearchResponseDto>

    @GET(POLL_ENDPOINT_PATH)
    fun poll(
        @Path(PATH_ORIGIN) origin: String,
        @Path(PATH_DESTINATION) destination: String,
        @Path(PATH_OUTBOUND_DATE) outboundDate: String,
        @Query(QUERY_ADULT) adults: Int,
        @Query(QUERY_INDEX) index: Int
    ): Single<PollResponseDto>
}