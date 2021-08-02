package com.filipebrandao.busbudchallenge.utils

import io.reactivex.rxjava3.schedulers.Schedulers

/**
 * Uses the Trampoline Scheduler for deterministic behavior when testing
 */
class TestSchedulerProvider : ISchedulerProvider {
    override fun useCasesScheduler() = Schedulers.trampoline()!!
    override fun uiThreadScheduler() = Schedulers.trampoline()!!
}
