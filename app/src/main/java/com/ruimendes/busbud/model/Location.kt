package com.ruimendes.busbud.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize

@Parcelize
data class Location (
    @Json(name = "id")
    val id: String,
    @Json(name = "city_id")
    val cityId: String,
    @Json(name = "name")
    val name: String,
    @Json(name = "address")
    val address: List<String>
): Parcelable