package com.filipebrandao.busbudchallenge.utils

import androidx.annotation.StringRes

/**
 * Resources wrapper that allows us to avoid using Android Context when testing
 */
interface IResourceProvider {
    fun getString(@StringRes resId: Int): String
    fun getString(@StringRes resId: Int, vararg args: Any): String
}
