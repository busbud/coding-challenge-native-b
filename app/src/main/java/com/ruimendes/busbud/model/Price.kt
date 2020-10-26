package com.ruimendes.busbud.model

import android.os.Parcelable
import com.squareup.moshi.Json
import kotlinx.android.parcel.Parcelize
import java.math.BigDecimal

@Parcelize
data class Price(
    @Json(name = "total")
    val total: BigDecimal,
    @Json(name = "currency")
    val currency: String
) : Parcelable