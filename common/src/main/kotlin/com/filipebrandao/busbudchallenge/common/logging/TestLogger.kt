package com.filipebrandao.busbudchallenge.common.logging

/**
 * Writes logs to the System.out descriptor. Use only when testing!
 */
@Suppress("SpreadOperator")
class TestLogger : ILogger {
    override fun v(tag: String, message: String, vararg args: Any) = logMessage(tag, null, message, args)

    override fun v(tag: String, t: Throwable, message: String, vararg args: Any) = logMessage(tag, t, message, args)

    override fun v(tag: String, t: Throwable) = logMessage(tag, t)

    override fun d(tag: String, message: String, vararg args: Any) = logMessage(tag, null, message, args)

    override fun d(tag: String, t: Throwable, message: String, vararg args: Any) = logMessage(tag, t, message, args)

    override fun d(tag: String, t: Throwable) = logMessage(tag, t)

    override fun i(tag: String, message: String, vararg args: Any) = logMessage(tag, null, message, args)

    override fun i(tag: String, t: Throwable, message: String, vararg args: Any) = logMessage(tag, t, message, args)

    override fun i(tag: String, t: Throwable) = logMessage(tag, t)

    override fun w(tag: String, message: String, vararg args: Any) = logMessage(tag, null, message, args)

    override fun w(tag: String, t: Throwable, message: String, vararg args: Any) = logMessage(tag, t, message, args)

    override fun w(tag: String, t: Throwable) = logMessage(tag, t)

    override fun e(tag: String, message: String, vararg args: Any) = logMessage(tag, null, message, args)

    override fun e(tag: String, t: Throwable, message: String, vararg args: Any) = logMessage(tag, t, message, args)

    override fun e(tag: String, t: Throwable) = logMessage(tag, t)

    private fun logMessage(tag: String, t: Throwable? = null, message: String? = null, vararg args: Any) {
        val sb = StringBuilder()

        sb.append("[${System.currentTimeMillis()}][${Thread.currentThread().name}][$tag]")

        message?.let {
            val formattedMessage = message.format(*(args[0] as Array<Any>))
            sb.append(" $formattedMessage")
        }

        t?.let {
            sb.append(" $t")
        }

        println(sb)
    }
}
