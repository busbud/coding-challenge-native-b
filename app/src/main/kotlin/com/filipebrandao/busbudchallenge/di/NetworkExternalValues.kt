package com.filipebrandao.busbudchallenge.di

import com.filipebrandao.busbudchallenge.api.IExternalValues

/**
 * Simple provider for the external values that the Network Layer need.
 * Ideally the base url wouldn't be hardcoded here fed from the build.gradle file allowing to have dev / staging / production builds connecting to different urls.
 * The auth token would also fetched from local storage.
 */
class NetworkExternalValues : IExternalValues {
    override fun getBaseUrl() = "https://napi.busbud.com/"
    override fun getAuthToken() = "PARTNER_c9g6z7V0SNqUlnar2EFsxw"
}