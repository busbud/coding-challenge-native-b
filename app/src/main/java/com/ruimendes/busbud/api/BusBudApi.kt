package com.ruimendes.busbud.api

import com.ruimendes.busbud.model.PollResult
import com.ruimendes.busbud.model.SearchResult
import io.reactivex.rxjava3.core.Single
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.Path
import retrofit2.http.Query

interface BusBudApi {

    /**
     * I could include on an HTTP interceptor (to not repeat myself on the different calls)
     * and store it in a build config, if different tokens for different environments.
     * However, for the sake of simplicity it is here!
     */
    companion object {
        const val ACCEPT_HEADER =
            "Accept: application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2"
        const val AUTH_TOKEN = "X-Busbud-Token: PARTNER_BaASYYHxTxuOINEOMWq5GA"
    }

    @GET("x-departures/{origin}/{destination}/{outboundDate}")
    @Headers(ACCEPT_HEADER, AUTH_TOKEN)
    fun doInitialSearch(
        @Path("origin") origin: String,
        @Path("destination") destination: String,
        @Path("outboundDate") outboundDate: String,
        @Query("adult") numberOfAdults: Int,
        @Query("currency") currency: String
    ): Single<SearchResult>

    @GET("x-departures/{origin}/{destination}/{outboundDate}/poll")
    @Headers(ACCEPT_HEADER, AUTH_TOKEN)
    fun poll(
        @Path("origin") origin: String,
        @Path("destination") destination: String,
        @Path("outboundDate") outboundDate: String,
        @Query("adult") numberOfAdults: Int,
        @Query("currency") currency: String,
        @Query("index") index: Int
    ): Single<PollResult>


}