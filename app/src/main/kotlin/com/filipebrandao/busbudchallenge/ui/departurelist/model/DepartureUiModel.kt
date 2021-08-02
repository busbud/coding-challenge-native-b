package com.filipebrandao.busbudchallenge.ui.departurelist.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class DepartureUiModel(
    val id: String,
    val operatorImageUrl: String,
    val departureTime: String,
    val departureCity: String,
    val departureLocation: String?,
    val arrivalTime: String,
    val arrivalCity: String,
    val arrivalLocation: String?,
    val price: String
) : Parcelable