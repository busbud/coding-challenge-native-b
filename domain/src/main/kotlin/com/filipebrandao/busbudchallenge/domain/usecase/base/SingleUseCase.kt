package com.filipebrandao.busbudchallenge.domain.usecase.base

import io.reactivex.rxjava3.core.Scheduler
import io.reactivex.rxjava3.core.Single
import io.reactivex.rxjava3.observers.DisposableSingleObserver

/**
 * Base class for the Use Cases that rely on a [Single] RXJava stream
 */
abstract class SingleUseCase<T, Parameters>(
    executionScheduler: Scheduler,
    postExecutionScheduler: Scheduler
) : BaseReactiveUseCase(executionScheduler, postExecutionScheduler) {

    /**
     * Builds a [Single] which will be used when the current [SingleUseCase] is executed
     */
    protected abstract fun buildUseCaseSingle(params: Parameters? = null): Single<T>

    /**
     * Executes the use case
     */
    fun execute(observer: DisposableSingleObserver<T>, params: Parameters? = null) {
        addDisposable(
            buildUseCaseSingle(params)
                .subscribeOn(executionScheduler)
                .observeOn(postExecutionScheduler)
                .subscribeWith(observer)
        )
    }
}
