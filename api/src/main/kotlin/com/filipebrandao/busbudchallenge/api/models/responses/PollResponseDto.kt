package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json

data class PollResponseDto(
    @Json(name = "operators")
    val operators: List<OperatorDto>,
    @Json(name = "departures")
    val departures: List<DepartureDto>,
    @Json(name = "complete")
    val complete: Boolean,
)
