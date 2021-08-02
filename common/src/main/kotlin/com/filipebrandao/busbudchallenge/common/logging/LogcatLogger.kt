package com.filipebrandao.busbudchallenge.common.logging

import android.util.Log


/**
 * Logs to LogCat.
 */
class LogcatLogger : ILogger {
    override fun v(tag: String, message: String, vararg args: Any) {
        Log.v(tag, message.format(*args))
    }

    override fun v(tag: String, t: Throwable, message: String, vararg args: Any) {
        Log.v(tag, message.format(*args), t)
    }

    override fun v(tag: String, t: Throwable) {
        Log.v(tag, null, t)
    }

    override fun d(tag: String, message: String, vararg args: Any) {
        Log.d(tag, message.format(*args))
    }

    override fun d(tag: String, t: Throwable, message: String, vararg args: Any) {
        Log.d(tag, message.format(*args), t)
    }

    override fun d(tag: String, t: Throwable) {
        Log.d(tag, null, t)
    }

    override fun i(tag: String, message: String, vararg args: Any) {
        Log.i(tag, message.format(*args))
    }

    override fun i(tag: String, t: Throwable, message: String, vararg args: Any) {
        Log.i(tag, message.format(*args), t)
    }

    override fun i(tag: String, t: Throwable) {
        Log.i(tag, null, t)
    }

    override fun w(tag: String, message: String, vararg args: Any) {
        Log.w(tag, message.format(*args))
    }

    override fun w(tag: String, t: Throwable, message: String, vararg args: Any) {
        Log.w(tag, message.format(*args), t)
    }

    override fun w(tag: String, t: Throwable) {
        Log.w(tag, null, t)
    }

    override fun e(tag: String, message: String, vararg args: Any) {
        Log.e(tag, message.format(*args))
    }

    override fun e(tag: String, t: Throwable, message: String, vararg args: Any) {
        Log.e(tag, message.format(*args), t)
    }

    override fun e(tag: String, t: Throwable) {
        Log.e(tag, null, t)
    }
}
