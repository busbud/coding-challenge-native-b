package com.filipebrandao.busbudchallenge.common.utils

import com.squareup.moshi.FromJson
import com.squareup.moshi.ToJson
import java.util.UUID

class UUIDAdapter {
    @ToJson
    fun toJson(uuid: UUID): String {
        return uuid.toString()
    }

    @FromJson
    fun fromJson(uuidString: String): UUID? {
        return UUID.fromString(uuidString)
    }
}
