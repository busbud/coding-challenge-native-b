package com.filipebrandao.busbudchallenge.ui.departurelist.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

sealed class FetchDeparturesUiResult : Parcelable {
    @Parcelize
    data class Success(val departures: List<DepartureUiModel>) : FetchDeparturesUiResult()

    @Parcelize
    data class Error(val error: String?) : FetchDeparturesUiResult()
}