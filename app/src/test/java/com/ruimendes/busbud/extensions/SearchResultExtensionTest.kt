package com.ruimendes.busbud.extensions

import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.whenever
import com.ruimendes.busbud.model.*
import com.ruimendes.busbud.ui.model.DepartureUIModel
import com.ruimendes.busbud.wrapper.formatters.NumberFormatterInterface
import junitparams.JUnitParamsRunner
import junitparams.Parameters
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import java.math.BigDecimal

@RunWith(JUnitParamsRunner::class)
class SearchResultExtensionTest {

    private companion object {
        const val LOGO_URL_1 = "https://1.com"
        const val LOGO_URL_2 = "https://2.com"

        const val LOCATION_NAME_1 = "Porto"
        const val LOCATION_NAME_2 = "Montreal"

        val OPERATOR_1 = mockOperator(id = "1", logoUrl = LOGO_URL_1)
        val OPERATOR_2 = mockOperator(id = "2", logoUrl = LOGO_URL_2)

        val LOCATION_1 = mockLocation(id = "1", name = LOCATION_NAME_1)
        val LOCATION_2 = mockLocation(id = "2", name = LOCATION_NAME_2)

        val PRICE_1 = Price(BigDecimal.TEN, "EUR")
        val PRICE_2 = Price(BigDecimal.ONE, "CAD")

        val PRICE_1_STRING = "€10.00"
        val PRICE_2_STRING = "CAD$1.00"

        val TIME_1 = "2020-01-15T15:15:00"
        val TIME_2 = "2020-01-15T23:15:00"

        val TIME_1_STRING = "15:15"
        val TIME_2_STRING = "23:15"

        val DEPARTURE_1 = mockDeparture(
            "1",
            "2",
            PRICE_1,
            TIME_1,
            TIME_2,
            "1"
        )

        val DEPARTURE_2 = mockDeparture(
            "2",
            "1",
            PRICE_2,
            TIME_2,
            TIME_1,
            "2"
        )


        fun mockOperator(id: String, logoUrl: String): Operator {
            return Operator(
                id,
                "name",
                "display_name",
                logoUrl
            )
        }

        fun mockLocation(id: String, name: String): Location {
            return Location(
                id,
                "cityId",
                name,
                emptyList()
            )
        }

        private fun mockDeparture(
            originLocationId: String,
            destinationLocationId: String,
            price: Price,
            departureTime: String,
            arrivalTime: String,
            operatorId: String
        ): Departure {

            return Departure(
                "id $originLocationId - $destinationLocationId",
                "class_name",
                1,
                price,
                departureTime,
                arrivalTime,
                operatorId,
                originLocationId,
                destinationLocationId
            )
        }
    }

    private val numberFormatter = mock<NumberFormatterInterface>()

    @Before
    fun setUp() {
        whenever(numberFormatter.formatPrice(PRICE_1.total, PRICE_1.currency))
            .thenReturn(PRICE_1_STRING)
        whenever(numberFormatter.formatPrice(PRICE_2.total, PRICE_2.currency))
            .thenReturn(PRICE_2_STRING)
    }

    @SuppressWarnings("unused")
    private fun testScenarios() = arrayOf(
        // Empty Departures - Empty List
        arrayOf(
            createSearchResult(
                locations = listOf(LOCATION_1, LOCATION_2),
                operators = listOf(OPERATOR_1, OPERATOR_2),
                departures = emptyList()
            ),
            emptyList<DepartureUIModel>()
        ),

        // 2 Departures - 2 Departures UI Model
        arrayOf(
            createSearchResult(
                locations = listOf(LOCATION_1, LOCATION_2),
                operators = listOf(OPERATOR_1, OPERATOR_2),
                departures = listOf(DEPARTURE_1, DEPARTURE_2)
            ),
            listOf(
                DepartureUIModel(
                    LOGO_URL_1,
                    TIME_1_STRING,
                    TIME_2_STRING,
                    LOCATION_NAME_1,
                    LOCATION_NAME_2,
                    PRICE_1_STRING
                ),
                DepartureUIModel(
                    LOGO_URL_2,
                    TIME_2_STRING,
                    TIME_1_STRING,
                    LOCATION_NAME_2,
                    LOCATION_NAME_1,
                    PRICE_2_STRING
                )
            )
        ),

        // 2 Departures (1 Unknown OPERATOR) - 1 Departure UI Model
        arrayOf(
            createSearchResult(
                locations = listOf(LOCATION_1, LOCATION_2),
                operators = listOf(OPERATOR_1),
                departures = listOf(DEPARTURE_1, DEPARTURE_2)
            ),
            listOf(
                DepartureUIModel(
                    LOGO_URL_1,
                    TIME_1_STRING,
                    TIME_2_STRING,
                    LOCATION_NAME_1,
                    LOCATION_NAME_2,
                    PRICE_1_STRING
                )
            )
        ),
        // 2 Departures (1 Unknown Location (arrival or departure) - emptyList
        arrayOf(
            createSearchResult(
                locations = listOf(LOCATION_2),
                operators = listOf(OPERATOR_1, OPERATOR_2),
                departures = listOf(DEPARTURE_1, DEPARTURE_2)
            ),
            emptyList<DepartureUIModel>()
        )
    )


    @Test
    @Parameters(method = "testScenarios")
    fun `test mapping of departures`(
        searchResult: SearchResult,
        expectedListOfDepartures: List<DepartureUIModel>
    ) {
        assertEquals(expectedListOfDepartures, searchResult.toListOfDepartures(numberFormatter))
    }

    private fun createSearchResult(
        departures: List<Departure>,
        locations: List<Location> = listOf(LOCATION_1, LOCATION_2),
        operators: List<Operator> = listOf(OPERATOR_1, OPERATOR_2),
    ): SearchResult {
        return SearchResult(
            originCityId = "1",
            destinationCityId = "2",
            cities = emptyList(),
            locations = locations,
            operators = operators,
            departures = departures,
            complete = true,
            ttl = 900,
            isValidRoute = true
        )
    }


}