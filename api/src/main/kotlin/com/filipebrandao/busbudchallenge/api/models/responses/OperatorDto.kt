package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json
import java.util.UUID

data class OperatorDto(
    @Json(name = "id")
    val id: UUID,
    @Json(name = "name")
    val name: String,
    @Json(name = "display_name")
    val displayName: String,
    @Json(name = "logo_url")
    val logoUrl: String
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as OperatorDto

        if (id != other.id) return false

        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}
