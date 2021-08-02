package com.filipebrandao.busbudchallenge.api

/**
 * Interface for the external values that should be provided to the NetworkLayer upon initialization
 */
interface IExternalValues {
    fun getBaseUrl(): String
    fun getAuthToken(): String
}
