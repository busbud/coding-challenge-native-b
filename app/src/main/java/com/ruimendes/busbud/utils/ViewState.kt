package com.ruimendes.busbud.utils

sealed class ViewState<out T> {
    object Loading : ViewState<Nothing>()
    object Empty : ViewState<Nothing>()
    data class Loaded<T>(val uiModel: T) : ViewState<T>()
    data class Error(val errorMessage: String) : ViewState<Nothing>()
}
