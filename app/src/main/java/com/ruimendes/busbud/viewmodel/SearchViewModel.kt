package com.ruimendes.busbud.viewmodel

import androidx.hilt.Assisted
import androidx.hilt.lifecycle.ViewModelInject
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import com.ruimendes.busbud.repository.SearchRepositoryInterface
import java.util.*

class SearchViewModel @ViewModelInject constructor(
    private val useCaseInterface: SearchRepositoryInterface,
    @Assisted private val savedStateHandle: SavedStateHandle
): ViewModel() {

    private companion object {
        const val DEFAULT_ORIGIN = "f2m673"
        const val DEFAULT_DESTINATION = "f25dvk"
        val DEFAULT_DATE = Date(1627516800000) // July 29th 2020 UTC
        const val DEFAULT_ADULTS = 1
        const val DEFAULT_CURRENCY = "CAD"
    }


}