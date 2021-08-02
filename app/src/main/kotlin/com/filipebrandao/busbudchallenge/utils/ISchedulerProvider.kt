package com.filipebrandao.busbudchallenge.utils

import io.reactivex.rxjava3.core.Scheduler

interface ISchedulerProvider {
    fun useCasesScheduler(): Scheduler
    fun uiThreadScheduler(): Scheduler
}
