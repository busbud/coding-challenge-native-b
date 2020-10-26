package com.ruimendes.busbud.utils

import com.ruimendes.busbud.utils.BigDecimalPriceAdapter.fromJson
import com.ruimendes.busbud.utils.BigDecimalPriceAdapter.toJson
import junitparams.JUnitParamsRunner
import junitparams.Parameters
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import java.math.BigDecimal

@RunWith(JUnitParamsRunner::class)
class BigDecimalPriceAdapterTest {

    @SuppressWarnings("unused")
    private fun arguments() = arrayOf(
        arrayOf("0", BigDecimal("0.00")),
        arrayOf("1", BigDecimal("0.01")),
        arrayOf("10", BigDecimal("0.10")),
        arrayOf("1000", BigDecimal("10.00")),
        arrayOf("1111", BigDecimal("11.11")),
        arrayOf("-1111", BigDecimal("-11.11"))
    )

    @Test
    @Parameters(method = "arguments")
    fun `test fromJson`(value: String, expected: BigDecimal) {
        assertEquals(expected, fromJson(value))
    }

    @Test
    @Parameters(method = "arguments")
    fun `test toJson`(expected: String, value: BigDecimal) {
        assertEquals(expected, toJson(value))
    }

}