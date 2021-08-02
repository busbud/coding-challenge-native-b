package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json

data class PriceDto(
    @Json(name = "total")
    val total: Long,
    @Json(name = "currency")
    val currency: String
)
