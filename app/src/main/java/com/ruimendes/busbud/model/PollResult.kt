package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class PollResult(
    @Json(name = "operators")
    val operators: List<Operator>,
    @Json(name = "departures")
    val departures: List<Departure>,
    @Json(name = "complete")
    val complete: Boolean,
    @Json(name = "ttl")
    val ttl: Long
)