package com.ruimendes.busbud.model

import com.squareup.moshi.Json

data class Operator(
    @Json(name = "id")
    val id: String,
    @Json(name = "name")
    val name: String,
    @Json(name = "display_name")
    val displayName: String,
    @Json(name = "logo_url")
    val logoUrl: String
)