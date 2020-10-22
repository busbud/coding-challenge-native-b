package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class SearchResult(
    @Json(name = "origin_city_id")
    val originCityId: String,
    @Json(name = "destination_city_id")
    val destinationCityId: String,
    @Json(name = "cities")
    val cities: List<City>,
    @Json(name = "locations")
    val locations: List<Location>,
    @Json(name = "operators")
    val operators: List<Operator>,
    @Json(name = "departures")
    val departures: List<Departure>,
    @Json(name = "complete")
    val complete: Boolean,
    @Json(name = "ttl")
    val ttl: Long,
    @Json(name = "is_valid_route")
    val isValidRoute: Boolean
)