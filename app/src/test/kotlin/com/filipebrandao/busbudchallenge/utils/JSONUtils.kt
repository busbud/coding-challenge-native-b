package com.filipebrandao.busbudchallenge.utils

import com.filipebrandao.busbudchallenge.common.utils.UUIDAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory

object JSONUtils {
    fun <T> parseJsonFromFile(jsonFileName: String, clazz: Class<T>): T {
        val json: String = javaClass.classLoader!!.getResourceAsStream(jsonFileName).bufferedReader().use { it.readText() }

        val moshi = Moshi.Builder()
            .add(UUIDAdapter())
            .addLast(KotlinJsonAdapterFactory())
            .build()

        val jsonAdapter = moshi.adapter(clazz)
        return jsonAdapter.fromJson(json)!!
    }
}