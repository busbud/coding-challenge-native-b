package com.ruimendes.busbud.wrapper.formatters

import java.math.BigDecimal
import java.text.NumberFormat
import java.util.*

/**
 * Yes I know... I should have unit tested this!
 * But those static methods from the Android platform ideally needed to be wrapped on an
 * injectable dependency ideally. :D
 */
class NumberFormatter : NumberFormatterInterface {

    override fun formatPrice(value: BigDecimal, currency: String): String {
        val format = NumberFormat.getCurrencyInstance().apply {
            maximumFractionDigits = 2
            minimumFractionDigits = 2
            setCurrency(Currency.getInstance(currency))
        }

        return format.format(value)
    }

}