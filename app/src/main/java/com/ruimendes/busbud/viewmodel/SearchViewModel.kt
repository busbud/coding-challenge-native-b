package com.ruimendes.busbud.viewmodel

import androidx.hilt.Assisted
import androidx.hilt.lifecycle.ViewModelInject
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import com.ruimendes.busbud.R
import com.ruimendes.busbud.extensions.formatToServer
import com.ruimendes.busbud.extensions.toDateUIModel
import com.ruimendes.busbud.extensions.toListOfDepartures
import com.ruimendes.busbud.model.PollResult
import com.ruimendes.busbud.model.SearchResult
import com.ruimendes.busbud.repository.SearchRepositoryInterface
import com.ruimendes.busbud.ui.model.DateUIModel
import com.ruimendes.busbud.ui.model.DepartureUIModel
import com.ruimendes.busbud.ui.model.SearchUIModel
import com.ruimendes.busbud.utils.ActionLiveData
import com.ruimendes.busbud.utils.ViewState
import com.ruimendes.busbud.wrapper.formatters.NumberFormatterInterface
import com.ruimendes.busbud.wrapper.platform.ResourcesInterface
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.disposables.CompositeDisposable
import io.reactivex.rxjava3.schedulers.Schedulers
import java.util.*

class SearchViewModel @ViewModelInject constructor(
    private val searchRepository: SearchRepositoryInterface,
    private val resources: ResourcesInterface,
    private val numberFormatter: NumberFormatterInterface,
    @Assisted private val savedStateHandle: SavedStateHandle
) : ViewModel() {

    private companion object {
        const val ORIGIN = "f2m673"
        const val DESTINATION = "f25dvk"

        val DEFAULT_DATE = Date(1627560000000) // July 29th 2021 - 12:00:00 UTC
        const val NUM_ADULTS = 1
        const val DEFAULT_CURRENCY = "EUR"

        const val STATE_LOADING = "loadingData"
        const val STATE_CACHE = "cachedResponse"
        const val STATE_TOOLBAR = "toolbar"
        const val STATE_DATE = "date"
        const val STATE_CURRENCY = "currency"
    }

    private val disposables = CompositeDisposable()
    private var cachedResponse: SearchResult? = savedStateHandle.get(STATE_CACHE)

    private var searchDate: Date = savedStateHandle.get(STATE_DATE) ?: DEFAULT_DATE
        set(value) {
            field = value
            searchToolbarData.value = searchToolbarData.value?.copy(date = value.formatToServer())
        }
    private var searchCurrency: String = savedStateHandle.get(STATE_CURRENCY) ?: DEFAULT_CURRENCY
        set(value) {
            field = value
            searchToolbarData.value = searchToolbarData.value?.copy(currency = value)
        }

    val datePickerAction = ActionLiveData<DateUIModel>()

    val viewState by lazy {
        savedStateHandle.getLiveData<ViewState<List<DepartureUIModel>>>(
            STATE_LOADING,
            ViewState.Loading
        )
    }

    val searchToolbarData by lazy {
        savedStateHandle.getLiveData<SearchUIModel>(
            STATE_TOOLBAR,
            SearchUIModel(
                resources.getStringResource(
                    R.string.search_info
                ),
                DEFAULT_DATE.formatToServer(),
                NUM_ADULTS.toString(),
                DEFAULT_CURRENCY
            )
        ).also {
            loadDataIfNeeded()
        }
    }

    private fun loadDataIfNeeded() {
        if (cachedResponse == null && disposables.size() == 0) {
            getInfoFromRepository(searchDate, searchCurrency)
        }
    }

    fun onDatePickerClicked() {
        datePickerAction.sendAction(searchDate.toDateUIModel())
    }

    fun onCurrencyUpdated(currency: String) {
        if (currency != searchCurrency) {
            searchCurrency = currency
            getInfoFromRepository(searchDate, currency)
        }
    }

    fun onDateUpdated(date: Date) {
        if (date != searchDate) {
            searchDate = date
            getInfoFromRepository(date, searchCurrency)
        }
    }

    private fun getInfoFromRepository(date: Date, currency: String) {
        disposables.clear()
        searchRepository
            .doInitialSearch(ORIGIN, DESTINATION, date, NUM_ADULTS, currency)
            .doOnSubscribe {
                viewState.value = ViewState.Loading
            }
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ searchResult ->
                cachedResponse = searchResult
                savedStateHandle.set(STATE_CACHE, cachedResponse)
                updateLiveData(searchResult.complete)
                if (!searchResult.complete) {
                    cachedResponse?.let {
                        pollDataFromRepository(date, currency, it.departures.size)
                    }
                }
            }, {
                viewState.value =
                    ViewState.Error(resources.getStringResource(R.string.search_error))
            })
            .also {
                disposables.add(it)
            }
    }

    private fun pollDataFromRepository(date: Date, currency: String, index: Int) {
        searchRepository
            .poll(ORIGIN, DESTINATION, date, NUM_ADULTS, currency, index)
            .observeOn(Schedulers.computation())
            .doOnEvent { pollResult, _ ->
                pollResult?.let {
                    cachedResponse = cachedResponse?.withExtraData(pollResult)
                    savedStateHandle.set(STATE_CACHE, cachedResponse)
                }
            }
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ pollResult ->
                updateLiveData(pollResult.complete)
                if (!pollResult.complete) {
                    cachedResponse?.let {
                        pollDataFromRepository(date, currency, it.departures.size)
                    }
                }
            }, {
                viewState.value =
                    ViewState.Error(resources.getStringResource(R.string.search_error))
            }).also {
                disposables.add(it)
            }
    }

    private fun updateLiveData(isComplete: Boolean) {
        cachedResponse?.let {
            if (it.departures.isNotEmpty()) {
                viewState.value = ViewState.Loaded(it.toListOfDepartures(numberFormatter))
            } else if (isComplete) {
                viewState.value = ViewState.Empty
            }
        }
    }

    private fun SearchResult.withExtraData(pollResult: PollResult): SearchResult {
        return this.copy(
            operators = operators.plus(pollResult.operators).distinct(),
            departures = departures.plus(pollResult.departures).distinct(),
            complete = pollResult.complete
        )
    }
}

