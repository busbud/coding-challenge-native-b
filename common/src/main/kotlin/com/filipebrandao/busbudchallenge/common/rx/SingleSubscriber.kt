package com.filipebrandao.busbudchallenge.common.rx

import androidx.annotation.NonNull
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import io.reactivex.rxjava3.observers.DisposableSingleObserver
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

open class SingleSubscriber<T> : DisposableSingleObserver<T>(), KoinComponent {

    companion object {
        private const val TAG = "SingleSubscriber"
    }

    private val logger: ILogger by inject()

    override fun onSuccess(@NonNull it: T) {
        logger.v(TAG, "onSuccess")
    }

    override fun onError(e: Throwable) {
        logger.e(TAG, e)
    }
}
