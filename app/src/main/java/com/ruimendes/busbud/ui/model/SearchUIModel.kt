package com.ruimendes.busbud.ui.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@Parcelize
data class SearchUIModel(
    val searchInfo: String,
    val date: String,
    val passengers: String,
    val currency: String
): Parcelable