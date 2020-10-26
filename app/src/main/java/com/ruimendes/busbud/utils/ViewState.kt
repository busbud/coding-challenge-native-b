package com.ruimendes.busbud.utils

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

sealed class ViewState<out T>: Parcelable {
    @Parcelize
    object Loading : ViewState<Nothing>()
    @Parcelize
    object Empty : ViewState<Nothing>()
    @Parcelize
    data class Loaded<T: Parcelable>(val uiModel: List<T>) : ViewState<T>()
    @Parcelize
    data class Error(val errorMessage: String) : ViewState<Nothing>()
}
