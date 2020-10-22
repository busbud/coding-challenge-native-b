package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class City(
    @Json(name = "id")
    val id: String,
    @Json(name = "name")
    val name: String,
    @Json(name = "full_name")
    val fullName: String
)