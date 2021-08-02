package com.filipebrandao.busbudchallenge.api.utils

import com.filipebrandao.busbudchallenge.common.logging.ILogger
import io.reactivex.rxjava3.observers.DisposableSingleObserver
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import retrofit2.HttpException

/**
 * Wires the DisposableSingleObserver along with our custom Retrofit errors
 */
abstract class SingleDisposable<T> : DisposableSingleObserver<T>(), KoinComponent {

    companion object {
        private const val TAG = "SingleDisposable"
    }

    private val logger: ILogger by inject()

    override fun onSuccess(result: T) {
        success(result)
    }

    override fun onError(e: Throwable) {
        if (e.message != null) {
            logger.e(TAG, e.message!!, e)
        } else {
            logger.e(TAG, e)
        }

        if (e is HttpException) {
            val response = e.response()
            error(RetrofitError(response, e))
        } else {
            error(RetrofitError(null, e))
        }
    }

    abstract fun success(result: T)

    abstract fun error(error: RetrofitError)
}
