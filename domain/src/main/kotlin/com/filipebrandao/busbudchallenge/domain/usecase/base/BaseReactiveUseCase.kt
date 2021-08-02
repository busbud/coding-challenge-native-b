package com.filipebrandao.busbudchallenge.domain.usecase.base

import com.filipebrandao.busbudchallenge.common.logging.ILogger
import io.reactivex.rxjava3.core.Scheduler
import io.reactivex.rxjava3.disposables.CompositeDisposable
import io.reactivex.rxjava3.disposables.Disposable
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

/**
 * Base class for Use Cases that rely on RXJava
 */
abstract class BaseReactiveUseCase(
    protected val executionScheduler: Scheduler,
    protected val postExecutionScheduler: Scheduler
) : KoinComponent {

    protected val logger: ILogger by inject()

    private val disposables = CompositeDisposable()

    /**
     * Disposes all the disposables associated to this Use Case
     */
    fun dispose() {
        if (!disposables.isDisposed) {
            disposables.dispose()
        }
    }

    /**
     * Stores a disposable that should be disposed later by calling [dispose]
     */
    protected fun addDisposable(disposable: Disposable) {
        disposables.add(disposable)
    }
}
