package com.ruimendes.busbud.model

import com.squareup.moshi.Json
import java.math.BigDecimal

data class Price(
    @Json(name = "total")
    val total: BigDecimal
)