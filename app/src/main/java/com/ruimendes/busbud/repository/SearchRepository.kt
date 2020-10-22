package com.ruimendes.busbud.repository

import com.ruimendes.busbud.api.BusBudApi
import com.ruimendes.busbud.model.PollResult
import com.ruimendes.busbud.model.SearchResult
import io.reactivex.rxjava3.core.Single
import java.text.SimpleDateFormat
import java.util.*

class SearchRepository(private val busBudApi: BusBudApi) : SearchRepositoryInterface {

    override fun doInitialSearch(
        origin: String,
        destination: String,
        outboundDate: Date,
        numberOfAdults: Int,
        currency: String
    ): Single<SearchResult> {

        return busBudApi.doInitialSearch(
            origin,
            destination,
            outboundDate.formatToServer(),
            numberOfAdults,
            currency
        )
    }

    override fun poll(
        origin: String,
        destination: String,
        outboundDate: Date,
        numberOfAdults: Int,
        currency: String
    ): Single<PollResult> {

        return busBudApi.poll(
            origin,
            destination,
            outboundDate.formatToServer(),
            numberOfAdults,
            currency
        )
    }

    /**
     * Some questions here if it should include Date or Date and Time.
     * Decided for the easy path for this - Date (yyyy-MM-dd)
     */
    private fun Date.formatToServer(): String {
        return SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(this)
    }
}