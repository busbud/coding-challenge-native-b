package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class Location (
    @Json(name = "id")
    val id: String,
    @Json(name = "cityId")
    val cityId: String,
    @Json(name = "name")
    val name: String,
    @Json(name = "address")
    val address: List<String>
)