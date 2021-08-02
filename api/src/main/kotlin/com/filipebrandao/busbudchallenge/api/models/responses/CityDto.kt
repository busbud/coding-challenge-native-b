package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json
import java.util.UUID

data class CityDto(
    @Json(name = "id")
    val id: UUID,
    @Json(name = "name")
    val name: String
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as CityDto

        if (id != other.id) return false

        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}
