package com.ruimendes.busbud.utils

import com.squareup.moshi.FromJson
import com.squareup.moshi.ToJson
import java.math.BigDecimal
import java.math.MathContext
import java.math.MathContext.UNLIMITED
import java.math.RoundingMode

object BigDecimalPriceAdapter {
    @FromJson
    fun fromJson(string: String) =
        BigDecimal(string).divide(BigDecimal(100)).setScale(2, RoundingMode.HALF_UP)

    @ToJson
    fun toJson(value: BigDecimal) =
        value.multiply(BigDecimal(100)).setScale(0, RoundingMode.HALF_UP).toString()
}