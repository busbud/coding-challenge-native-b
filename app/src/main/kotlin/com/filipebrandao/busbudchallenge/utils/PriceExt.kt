package com.filipebrandao.busbudchallenge.utils

import java.math.BigDecimal
import java.math.RoundingMode

/**
 * Converts a price value without decimal places (such as 1234) to a proper decimal value (12.34)
 */
fun Long.asPriceFloat() = BigDecimal(this).divide(BigDecimal.valueOf(100)).setScale(2, RoundingMode.HALF_UP)!!