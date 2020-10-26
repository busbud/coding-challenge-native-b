package com.ruimendes.busbud.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize

@Parcelize
data class Departure(
    @Json(name = "id")
    val id: String,
    @Json(name = "class_name")
    val className: String,
    @Json(name = "available_seats")
    val availableSeats: Int,
    @Json(name = "prices")
    val prices: Price,
    @Json(name = "departure_time")
    val departureTime: String,
    @Json(name = "arrival_time")
    val arrivalTime: String,
    @Json(name = "operator_id")
    val operatorId: String,
    @Json(name = "origin_location_id")
    val originLocationId: String,
    @Json(name = "destination_location_id")
    val destinationLocationId: String,
): Parcelable