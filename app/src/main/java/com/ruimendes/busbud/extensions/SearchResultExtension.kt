package com.ruimendes.busbud.extensions

import com.ruimendes.busbud.model.SearchResult
import com.ruimendes.busbud.ui.model.DepartureUIModel
import com.ruimendes.busbud.wrapper.formatters.NumberFormatterInterface
import java.text.ParseException

/**
 * For sake of simplicity I assumed that operators always have a logo being returned.
 */
fun SearchResult.toListOfDepartures(numberFormatter: NumberFormatterInterface): List<DepartureUIModel> {
    return departures
        .map { departure ->
            val operator = operators.find { it.id == departure.operatorId }
            val originLocation = locations.find { it.id == departure.originLocationId }
            val destinationLocation = locations.find { it.id == departure.destinationLocationId }
            DepartureUIModel(
                operatorLogoUrl = operator?.logoUrl ?: "",
                departureTime = extractTimeFromString(departure.departureTime),
                arrivalTime = extractTimeFromString(departure.arrivalTime),
                departureName = originLocation?.name ?: "",
                arrivalName = destinationLocation?.name ?: "",
                price = numberFormatter.formatPrice(
                    departure.prices.total,
                    departure.prices.currency
                )
            )
        }.filter { departureUIModel ->
            with(departureUIModel) {
                operatorLogoUrl.isNotEmpty() &&
                        departureTime.isNotEmpty() &&
                        arrivalTime.isNotEmpty() &&
                        departureName.isNotEmpty()
                        && arrivalName.isNotEmpty()
            }
        }
        .toList()
}

private fun extractTimeFromString(dateString: String): String {
    return try {
        dateString.asDate()?.formatHourMin() ?: ""
    } catch (exception: ParseException) {
        ""
    }
}