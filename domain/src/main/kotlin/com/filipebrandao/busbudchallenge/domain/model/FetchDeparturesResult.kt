package com.filipebrandao.busbudchallenge.domain.model

import com.filipebrandao.busbudchallenge.api.models.responses.CityDto
import com.filipebrandao.busbudchallenge.api.models.responses.DepartureDto
import com.filipebrandao.busbudchallenge.api.models.responses.LocationDto
import com.filipebrandao.busbudchallenge.api.models.responses.OperatorDto

/**
 * Wraps all Departures and their Operators
 */
data class FetchDeparturesResult(
    val departures: HashSet<DepartureDto> = hashSetOf(),
    val operators: HashSet<OperatorDto> = hashSetOf(),
    val locations: HashSet<LocationDto> = hashSetOf(),
    val cities: HashSet<CityDto> = hashSetOf(),
) {
    fun add(result: FetchDeparturesResult) {
        departures.addAll(result.departures)
        operators.addAll(result.operators)
        locations.addAll(result.locations)
        cities.addAll(result.cities)
    }
}