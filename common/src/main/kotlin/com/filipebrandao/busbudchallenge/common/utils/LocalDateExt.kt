package com.filipebrandao.busbudchallenge.common.utils

import org.threeten.bp.LocalDate
import org.threeten.bp.LocalDateTime

// converts a LocalDate into a string with the format expected for the server params
fun LocalDate.toServerFormat(): String = "${year}-${String.format("%02d", monthValue)}-${dayOfMonth}"

fun LocalDateTime.toHHMMFormat() = "${String.format("%02d", hour)}:${String.format("%02d", minute)}"
