package com.ruimendes.busbud.wrapper.platform

import androidx.annotation.StringRes

interface ResourcesInterface {
    fun getStringResource(@StringRes identifier: Int): String
}