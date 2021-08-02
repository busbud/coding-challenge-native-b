package com.filipebrandao.busbudchallenge.api.models.responses

import com.squareup.moshi.Json
import java.util.UUID

data class DepartureDto(
    @Json(name = "id")
    val id: String,
    @Json(name = "class_name")
    val className: String,
    @Json(name = "available_seats")
    val availableSeats: Int,
    @Json(name = "prices")
    val prices: PriceDto,
    @Json(name = "departure_time")
    val departureTime: String,
    @Json(name = "arrival_time")
    val arrivalTime: String,
    @Json(name = "operator_id")
    val operatorId: UUID,
    @Json(name = "origin_location_id")
    val originLocationId: Long,
    @Json(name = "destination_location_id")
    val destinationLocationId: Long
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as DepartureDto

        if (id != other.id) return false

        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}