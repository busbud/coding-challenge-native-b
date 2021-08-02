package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json

data class SearchResponseDto(
    @Json(name = "origin_city_id")
    val originCityId: String,
    @Json(name = "destination_city_id")
    val destinationCityId: String,
    @Json(name = "cities")
    val cities: List<CityDto>,
    @Json(name = "locations")
    val locations: List<LocationDto>,
    @Json(name = "operators")
    val operators: List<OperatorDto>,
    @Json(name = "departures")
    val departures: List<DepartureDto>,
    @Json(name = "complete")
    val complete: Boolean,
    @Json(name = "ttl")
    val ttl: Long,
    @Json(name = "is_valid_route")
    val isValidRoute: Boolean
)

