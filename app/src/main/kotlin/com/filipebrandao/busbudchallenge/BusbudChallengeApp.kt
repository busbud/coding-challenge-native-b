package com.filipebrandao.busbudchallenge

import android.app.Application
import com.filipebrandao.busbudchallenge.di.DependencyInjectionEnvironment

class BusbudChallengeApp : Application() {

    override fun onCreate() {
        super.onCreate()
        DependencyInjectionEnvironment.init(this)
    }
}
