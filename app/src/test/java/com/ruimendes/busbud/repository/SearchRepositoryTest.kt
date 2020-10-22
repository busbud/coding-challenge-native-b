package com.ruimendes.busbud.repository

import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.whenever
import com.ruimendes.busbud.api.BusBudApi
import com.ruimendes.busbud.model.PollResult
import com.ruimendes.busbud.model.SearchResult
import com.ruimendes.busbud.rules.RxJavaTestSchedulersRule
import io.reactivex.rxjava3.core.Single
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.lang.Exception
import java.util.*


@RunWith(JUnit4::class)
class SearchRepositoryTest {

    @get:Rule
    val schedulersRule = RxJavaTestSchedulersRule()

    private companion object {
        const val ORIGIN = "origin"
        const val DESTINATION = "destination"
        val OUTBOUND_DATE = Date(1468180800000)
        const val NUM_ADULTS = 1
        const val CURRENCY = "EUR"

        const val EXPECTED_DATE = "2016-07-10"
    }

    private val busBudApi = mock<BusBudApi>()

    private val searchRepository = SearchRepository(busBudApi)

    @Test
    fun `test doInitialSearch with Success`() {
        val searchResult = mockSearchResult()
        arrange {
            withInitialSearchResponse(searchResult)
        }

        searchRepository
            .doInitialSearch(ORIGIN, DESTINATION, OUTBOUND_DATE, NUM_ADULTS, CURRENCY)
            .test()
            .assertValue(searchResult)
            .assertComplete()
    }

    @Test
    fun `test doInitialSearch with Error`() {
        val throwable = Exception("error!")
        arrange {
            withInitialSearchError(throwable)
        }

        searchRepository
            .doInitialSearch(ORIGIN, DESTINATION, OUTBOUND_DATE, NUM_ADULTS, CURRENCY)
            .test()
            .assertError(throwable)
    }

    @Test
    fun `test poll with Success`() {
        val pollResult = mockPollResult()
        arrange {
            withPollResponse(pollResult)
        }

        searchRepository
            .poll(ORIGIN, DESTINATION, OUTBOUND_DATE, NUM_ADULTS, CURRENCY)
            .test()
            .assertValue(pollResult)
            .assertComplete()
    }

    @Test
    fun `test poll with Error`() {
        val throwable = Exception("error!")
        arrange {
            withPollError(throwable)
        }

        searchRepository
            .poll(ORIGIN, DESTINATION, OUTBOUND_DATE, NUM_ADULTS, CURRENCY)
            .test()
            .assertError(throwable)
    }

    private fun mockSearchResult(): SearchResult {
        return SearchResult(
            originCityId = "originCityId",
            destinationCityId = "destinationCityId",
            cities = emptyList(),
            locations = emptyList(),
            operators = emptyList(),
            departures = emptyList(),
            complete = true,
            ttl = 9600,
            isValidRoute = true
        )
    }

    private fun mockPollResult(): PollResult {
        return PollResult(
            operators = emptyList(),
            departures = emptyList(),
            complete = true,
            ttl = 9600
        )
    }

    private fun arrange(body: ArrangeBuilder.() -> Unit) = ArrangeBuilder().apply { body() }

    inner class ArrangeBuilder {

        private val initialSearchCall by lazy {
            busBudApi.doInitialSearch(ORIGIN, DESTINATION, EXPECTED_DATE, NUM_ADULTS, CURRENCY)
        }

        private val pollCall by lazy {
            busBudApi.poll(ORIGIN, DESTINATION, EXPECTED_DATE, NUM_ADULTS, CURRENCY)
        }

        fun withInitialSearchResponse(searchResult: SearchResult) {
            whenever(initialSearchCall)
                .thenReturn(Single.just(searchResult))
        }

        fun withInitialSearchError(throwable: Throwable) {
            whenever(initialSearchCall)
                .thenReturn(Single.error(throwable))
        }

        fun withPollResponse(pollResult: PollResult) {
            whenever(pollCall)
                .thenReturn(Single.just(pollResult))
        }

        fun withPollError(throwable: Throwable) {
            whenever(pollCall)
                .thenReturn(Single.error(throwable))
        }
    }
}