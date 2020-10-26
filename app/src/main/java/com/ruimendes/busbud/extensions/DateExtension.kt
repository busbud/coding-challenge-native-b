package com.ruimendes.busbud.extensions

import com.ruimendes.busbud.ui.model.DateUIModel
import java.text.SimpleDateFormat
import java.util.*
import java.util.regex.Pattern

/**
 * Some questions here if it should include Date or Date and Time.
 * Decided for the easy path for this - Date (yyyy-MM-dd)
 *
 * Also didn't unit test this due to the Locale.
 * Ideally Locale would be injected so we could mock it and guarantee 100% certainty of the tests.
 * Didn't want to over-engineer in this project. :)
 */
fun Date.formatToServer(): String {
    return SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(this)
}

fun Date.formatYear(): String {
    return SimpleDateFormat("yyyy", Locale.getDefault()).format(this)
}

fun Date.formatMonth(): String {
    return SimpleDateFormat("MM", Locale.getDefault()).format(this)
}

fun Date.formatDay(): String {
    return SimpleDateFormat("dd", Locale.getDefault()).format(this)
}

fun Date.formatHourMin(): String {
    return SimpleDateFormat("HH:mm", Locale.getDefault()).format(this)
}

fun String.asDate(pattern: String = "yyyy-MM-dd'T'HH:mm:ss"): Date? {
    return SimpleDateFormat(pattern, Locale.getDefault()).parse(this)
}

fun Date.toDateUIModel(): DateUIModel {
    return DateUIModel(formatYear().toInt(), formatMonth().toInt() -1, formatDay().toInt())
}