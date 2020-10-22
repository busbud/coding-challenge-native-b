package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class Departure(
    @Json(name = "id")
    val id: String,
    @Json(name = "class_name")
    val className: String,
    @Json(name = "available_seats")
    val availableSeats: Int,
    @Json(name = "prices")
    val prices: Price,
    @Json(name = "departure_timezone")
    val departureTimezone: String,
    @Json(name = "arrival_timezone")
    val arrivalTimezone: String,
    @Json(name = "departure_time")
    val departureTime: String,
    @Json(name = "arrival_time")
    val arrivalTime: String
)