package com.filipebrandao.busbudchallenge.api.httpclients

/**
 * Interface that defines the barebones of the HttpClient's factories
 */
interface IHttpClientFactory<T> {
    fun create(): T
}
