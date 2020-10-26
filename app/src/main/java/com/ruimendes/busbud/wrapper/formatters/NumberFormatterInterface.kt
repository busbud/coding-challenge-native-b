package com.ruimendes.busbud.wrapper.formatters

import java.math.BigDecimal

interface NumberFormatterInterface {
    fun formatPrice(value: BigDecimal, currency: String): String
}