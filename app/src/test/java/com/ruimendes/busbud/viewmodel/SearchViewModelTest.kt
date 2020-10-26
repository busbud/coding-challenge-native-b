package com.ruimendes.busbud.viewmodel

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.SavedStateHandle
import com.nhaarman.mockitokotlin2.*
import com.ruimendes.busbud.R
import com.ruimendes.busbud.extensions.toListOfDepartures
import com.ruimendes.busbud.model.*
import com.ruimendes.busbud.repository.SearchRepositoryInterface
import com.ruimendes.busbud.rules.RxJavaTestSchedulersRule
import com.ruimendes.busbud.ui.model.DateUIModel
import com.ruimendes.busbud.ui.model.DepartureUIModel
import com.ruimendes.busbud.ui.model.SearchUIModel
import com.ruimendes.busbud.utils.ViewState
import com.ruimendes.busbud.wrapper.formatters.NumberFormatterInterface
import com.ruimendes.busbud.wrapper.platform.ResourcesInterface
import io.reactivex.rxjava3.core.Single
import org.junit.Rule
import org.junit.Test
import java.math.BigDecimal
import java.util.*

class SearchViewModelTest {

    private companion object {
        const val ORIGIN = "f2m673"
        const val DESTINATION = "f25dvk"
        val DEFAULT_DATE = Date(1627560000000) // July 29th 2021 - 12:00:00 UTC
        const val NUM_ADULTS = 1
        const val DEFAULT_CURRENCY = "EUR"

        const val SEARCH_INFO = "Porto -> Montreal"
        const val DATE_STRING = "2021-07-29"
        const val PRICE_FORMATTED = "€31.21"
        const val SEARCH_ERROR = "error!"
    }

    @get:Rule
    val rule = InstantTaskExecutorRule()

    @get:Rule
    val schedulersRule = RxJavaTestSchedulersRule()

    private val searchRepository = mock<SearchRepositoryInterface>()
    private val resources = mock<ResourcesInterface>()
    private val numberFormatter = mock<NumberFormatterInterface>()
    private val savedStateHandle = mock<SavedStateHandle>()

    private lateinit var viewModel: SearchViewModel

    private val viewStateObserver = mock<Observer<ViewState<List<DepartureUIModel>>>>()
    private val searchToolbarObserver = mock<Observer<SearchUIModel>>()
    private val datePickerActionObserver = mock<Observer<DateUIModel>>()

    // region init

    @Test
    fun `on init should fetch data for default values if cachedResponse is null and view state should be loading`() {
        arrange {
            withInitialSearchResponse(mockSearchResult())
        }

        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        inOrder(viewStateObserver, searchRepository) {
            verify(viewStateObserver).onChanged(ViewState.Loading)
            verify(searchRepository).doInitialSearch(
                ORIGIN,
                DESTINATION,
                DEFAULT_DATE,
                NUM_ADULTS,
                DEFAULT_CURRENCY
            )
        }
    }

    @Test
    fun `on init toolbar data should contain default data`() {
        arrange {
            withInitialSearchResponse(mockSearchResult())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        val expectedSearchUIModel = SearchUIModel(
            SEARCH_INFO,
            DATE_STRING,
            NUM_ADULTS.toString(),
            DEFAULT_CURRENCY
        )

        verify(searchToolbarObserver).onChanged(expectedSearchUIModel)
    }

    @Test
    fun `on init with cachedResponse on saved state should result on no call to the repository`() {
        arrange {
            withCachedResult(mockSearchResult())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        val expectedSearchUIModel = SearchUIModel(
            SEARCH_INFO,
            DATE_STRING,
            NUM_ADULTS.toString(),
            DEFAULT_CURRENCY
        )
        verify(searchToolbarObserver).onChanged(expectedSearchUIModel)
        verifyZeroInteractions(searchRepository)
    }

    // endregion

    // region DatePickerAction

    @Test
    fun `when date picker is clicked it should propagate dateUIModel to view`() {
        arrange {
            withCachedResult(mockSearchResult())
        }

        viewModel.datePickerAction.observeForever(datePickerActionObserver)
        viewModel.onDatePickerClicked()

        verify(datePickerActionObserver, only()).onChanged(DateUIModel(2021, 6, 29))
    }

    @Test
    fun `when date is updated toolbar UI model is changed and new call to the repository occurs`() {

        val newDate = Date(1609506000000) // Jan 1st 2021 - 12:00:00 UTC
        val expectedSearchUIModel = SearchUIModel(
            SEARCH_INFO,
            "2021-01-01",
            NUM_ADULTS.toString(),
            DEFAULT_CURRENCY
        )

        arrange {
            withCachedResult(mockSearchResult())
            withDateForInitialSearch(newDate)
            withInitialSearchResponse(mockSearchResult())
        }

        viewModel.datePickerAction.observeForever(datePickerActionObserver)
        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        viewModel.onDateUpdated(newDate)

        inOrder(searchToolbarObserver, searchRepository) {
            verify(searchToolbarObserver).onChanged(expectedSearchUIModel)
            verify(searchRepository).doInitialSearch(
                ORIGIN,
                DESTINATION,
                newDate,
                NUM_ADULTS,
                DEFAULT_CURRENCY
            )
            verifyNoMoreInteractions()
        }
    }

    @Test
    fun `when onDateUpdated is called with same date repository is not called`() {
        arrange {
            withCachedResult(mockSearchResult())
        }

        viewModel.onDateUpdated(DEFAULT_DATE)

        verifyZeroInteractions(searchRepository)
    }

    // endregion

    // region Currency

    @Test
    fun `when currency is updated toolbar UI model is changed and new call to the repository occurs`() {

        val newCurrency = "USD"
        val expectedSearchUIModel = SearchUIModel(
            SEARCH_INFO,
            DATE_STRING,
            NUM_ADULTS.toString(),
            newCurrency
        )

        arrange {
            withCachedResult(mockSearchResult())
            withCurrencyForInitialSearch(newCurrency)
            withInitialSearchResponse(mockSearchResult())
        }

        viewModel.datePickerAction.observeForever(datePickerActionObserver)
        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        viewModel.onCurrencyUpdated(newCurrency)

        inOrder(searchToolbarObserver, searchRepository) {
            verify(searchToolbarObserver).onChanged(expectedSearchUIModel)
            verify(searchRepository).doInitialSearch(
                ORIGIN,
                DESTINATION,
                DEFAULT_DATE,
                NUM_ADULTS,
                newCurrency
            )
            verifyNoMoreInteractions()
        }
    }

    @Test
    fun `when onCurrencyUpdated is called with same currency repository is not called`() {
        arrange {
            withCachedResult(mockSearchResult())
        }

        viewModel.onCurrencyUpdated(DEFAULT_CURRENCY)

        verifyZeroInteractions(searchRepository)
    }

    // endregion

    // region repository continue interaction

    @Test
    fun `when response from doInitialSearch returns complete false we should poll with correct index - empty data`() {
        arrange {
            withInitialSearchResponse(mockSearchResult(isComplete = false))
            withPollResponse(forIndex = 0, pollResult = mockPollResult())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        verify(searchRepository).poll(
            ORIGIN,
            DESTINATION,
            DEFAULT_DATE,
            NUM_ADULTS,
            DEFAULT_CURRENCY,
            0
        )
    }

    @Test
    fun `when response from doInitialSearch returns complete false we should poll with correct index - with data`() {
        arrange {
            withInitialSearchResponse(mockSearchResult(isComplete = false, numDepartures = 10))
            withPollResponse(forIndex = 10, pollResult = mockPollResult())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        verify(searchRepository).poll(
            ORIGIN,
            DESTINATION,
            DEFAULT_DATE,
            NUM_ADULTS,
            DEFAULT_CURRENCY,
            10
        )
    }

    @Test
    fun `when response from poll returns complete false we should poll extra with correct index`() {
        arrange {
            withInitialSearchResponse(mockSearchResult(isComplete = false, numDepartures = 10))
            withPollResponse(
                forIndex = 10,
                pollResult = mockPollResult(isComplete = false, startIndex = 10, numDepartures = 10)
            )
            withPollResponse(forIndex = 20, pollResult = mockPollResult(isComplete = true))
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        inOrder(searchRepository) {
            verify(searchRepository).poll(
                ORIGIN,
                DESTINATION,
                DEFAULT_DATE,
                NUM_ADULTS,
                DEFAULT_CURRENCY,
                10
            )
            verify(searchRepository).poll(
                ORIGIN,
                DESTINATION,
                DEFAULT_DATE,
                NUM_ADULTS,
                DEFAULT_CURRENCY,
                20
            )
        }
    }

    // endregion

    // region viewState scenarios

    @Test
    fun `when data from repository is empty then empty view state is propagated`() {
        arrange {
            withInitialSearchResponse(mockSearchResult(isComplete = false))
            withPollResponse(forIndex = 0, pollResult = mockPollResult())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)
        viewModel.viewState.observeForever(viewStateObserver)

        verify(viewStateObserver).onChanged(ViewState.Empty)
    }

    @Test
    fun `when data from repository contains data on initialSearch and poll then two Loaded events are sent`() {
        val initialSearchResponse = mockSearchResult(isComplete = false, numDepartures = 1)
        val pollResponse = mockPollResult(isComplete = true, startIndex = 1, numDepartures = 1)
        val expectedFinalResult = mockSearchResult(numDepartures = 2)
        arrange {
            withInitialSearchResponse(initialSearchResponse)
            withPollResponse(
                forIndex = 1,
                pollResult = pollResponse
            )
        }

        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        inOrder(viewStateObserver) {
            verify(viewStateObserver).onChanged(
                ViewState.Loaded(
                    initialSearchResponse.toListOfDepartures(
                        numberFormatter
                    )
                )
            )
            verify(viewStateObserver).onChanged(
                ViewState.Loaded(
                    expectedFinalResult.toListOfDepartures(
                        numberFormatter
                    )
                )
            )
            verifyNoMoreInteractions()
        }
    }

    @Test
    fun `when data from repository is empty on initialSearch and poll contains data empty state is never sent`() {
        val initialSearchResponse = mockSearchResult(isComplete = false, numDepartures = 0)
        val pollResponse = mockPollResult(isComplete = true, startIndex = 0, numDepartures = 5)

        arrange {
            withInitialSearchResponse(initialSearchResponse)
            withPollResponse(
                forIndex = 0,
                pollResult = pollResponse
            )
        }

        viewModel.viewState.observeForever(viewStateObserver)
        viewModel.searchToolbarData.observeForever(searchToolbarObserver)

        verify(viewStateObserver, never()).onChanged(ViewState.Empty)
    }

    @Test
    fun `when initialSearchResult returns error it is propagated to view`() {
        arrange {
            withInitialSearchError(Exception())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)
        viewModel.viewState.observeForever(viewStateObserver)

        verify(viewStateObserver).onChanged(ViewState.Error(SEARCH_ERROR))
    }

    @Test
    fun `when pollResult returns error it is propagated to view`() {
        arrange {
            withInitialSearchResponse(mockSearchResult(isComplete = false))
            withPollError(forIndex = 0, throwable = Exception())
        }

        viewModel.searchToolbarData.observeForever(searchToolbarObserver)
        viewModel.viewState.observeForever(viewStateObserver)

        verify(viewStateObserver).onChanged(ViewState.Error(SEARCH_ERROR))
    }

    // endregion

    private fun arrange(body: ArrangeBuilder.() -> Unit) = ArrangeBuilder().apply {
        body()
        viewModel = SearchViewModel(searchRepository, resources, numberFormatter, savedStateHandle)
    }

    // region mock data

    private fun mockSearchResult(isComplete: Boolean = true, numDepartures: Int = 0): SearchResult {
        return SearchResult(
            ORIGIN,
            DESTINATION,
            emptyList(),
            listOf(mockDestinationLocation(), mockOriginLocation()),
            listOf(mockOperator()),
            mockDepartures(numDepartures),
            isComplete,
            900,
            true
        )
    }

    private fun mockPollResult(
        isComplete: Boolean = true,
        numDepartures: Int = 0,
        startIndex: Int = 0
    ): PollResult {
        return PollResult(
            emptyList(),
            mockDepartures(numDepartures, startIndex),
            isComplete,
            900
        )
    }

    fun mockOperator(): Operator {
        return Operator(
            "operatorId",
            "name",
            "display_name",
            "logoUrl"
        )
    }

    fun mockOriginLocation(): Location {
        return Location(
            "originLocationId",
            "cityId",
            "origin",
            emptyList()
        )
    }

    fun mockDestinationLocation(): Location {
        return Location(
            "destinationLocationId",
            "cityId",
            "destination",
            emptyList()
        )
    }

    private fun mockDepartures(size: Int, startIndex: Int = 0): List<Departure> {
        val departures = mutableListOf<Departure>()
        for (i in 0 until size) {
            val index = startIndex + i
            departures.add(
                Departure(
                    index.toString(),
                    "className",
                    1,
                    Price(BigDecimal.TEN, DEFAULT_CURRENCY),
                    "2020-01-15T15:15:00",
                    "2020-01-15T15:16:00",
                    "operatorId",
                    "originLocationId",
                    "destinationLocationId"
                )
            )
        }
        return departures
    }

    // endregion

    inner class ArrangeBuilder {
        init {
            val captor = argumentCaptor<Any>()

            whenever(savedStateHandle.getLiveData(any(), captor.capture()))
                .then {
                    MutableLiveData(captor.lastValue)
                }

            whenever(resources.getStringResource(R.string.search_info))
                .thenReturn(SEARCH_INFO)

            whenever(numberFormatter.formatPrice(any(), any()))
                .thenReturn(PRICE_FORMATTED)

            whenever(resources.getStringResource(R.string.search_error))
                .thenReturn(SEARCH_ERROR)
        }

        var currency: String = DEFAULT_CURRENCY
        var date: Date = DEFAULT_DATE

        fun withInitialSearchResponse(searchResult: SearchResult) {
            whenever(
                searchRepository.doInitialSearch(
                    ORIGIN,
                    DESTINATION,
                    date,
                    NUM_ADULTS,
                    currency
                )
            ).thenReturn(Single.just(searchResult))
        }

        fun withInitialSearchError(throwable: Throwable) {
            whenever(
                searchRepository.doInitialSearch(
                    ORIGIN,
                    DESTINATION,
                    date,
                    NUM_ADULTS,
                    currency
                )
            ).thenReturn(Single.error(throwable))
        }

        fun withPollResponse(forIndex: Int, pollResult: PollResult) {
            whenever(
                searchRepository.poll(
                    ORIGIN,
                    DESTINATION,
                    date,
                    NUM_ADULTS,
                    currency,
                    forIndex
                )
            ).thenReturn(Single.just(pollResult))
        }

        fun withPollError(forIndex: Int, throwable: Throwable) {
            whenever(
                searchRepository.poll(
                    ORIGIN,
                    DESTINATION,
                    date,
                    NUM_ADULTS,
                    currency,
                    forIndex
                )
            ).thenReturn(Single.error(throwable))
        }

        fun withDateForInitialSearch(date: Date) {
            this.date = date
        }

        fun withCurrencyForInitialSearch(currency: String) {
            this.currency = currency
        }

        fun withCachedResult(searchResult: SearchResult) {
            whenever<SearchResult?>(savedStateHandle.get("cachedResponse"))
                .thenReturn(searchResult)
        }
    }

}