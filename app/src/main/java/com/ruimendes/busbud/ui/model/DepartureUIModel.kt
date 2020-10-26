package com.ruimendes.busbud.ui.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class DepartureUIModel(
    val operatorLogoUrl: String,
    val departureTime: String,
    val arrivalTime: String,
    val departureName: String,
    val arrivalName: String,
    val price: String
): Parcelable