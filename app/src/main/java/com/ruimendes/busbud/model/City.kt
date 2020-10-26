package com.ruimendes.busbud.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize

@Parcelize
data class City(
    @Json(name = "id")
    val id: String,
    @Json(name = "name")
    val name: String
): Parcelable