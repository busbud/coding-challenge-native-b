package com.filipebrandao.busbudchallenge.utils

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.core.Scheduler
import io.reactivex.rxjava3.schedulers.Schedulers

/**
 * Provides the Schedulers that will be commonly used when subscribing to RX streams
 */
class SchedulerProvider : ISchedulerProvider {

    override fun useCasesScheduler(): Scheduler = Schedulers.computation()

    override fun uiThreadScheduler(): Scheduler = AndroidSchedulers.mainThread()
}
