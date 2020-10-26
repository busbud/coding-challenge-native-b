package com.ruimendes.busbud.repository

import com.ruimendes.busbud.model.PollResult
import com.ruimendes.busbud.model.SearchResult
import io.reactivex.rxjava3.core.Single
import java.util.*

interface SearchRepositoryInterface {

    fun doInitialSearch(
        origin: String,
        destination: String,
        outboundDate: Date,
        numberOfAdults: Int,
        currency: String
    ): Single<SearchResult>

    fun poll(
        origin: String,
        destination: String,
        outboundDate: Date,
        numberOfAdults: Int,
        currency: String,
        index: Int
    ): Single<PollResult>
}