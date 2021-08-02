package com.filipebrandao.busbudchallenge.utils

import android.content.Context
import androidx.annotation.StringRes

class ResourceProvider(private val context: Context) : IResourceProvider {

    override fun getString(@StringRes resId: Int): String {
        return context.getString(resId)
    }

    @Suppress("SpreadOperator")
    override fun getString(@StringRes resId: Int, vararg args: Any): String {
        return context.getString(resId, *args)
    }
}
