package com.ruimendes.busbud.utils

import androidx.annotation.MainThread
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer

/**
 * Wraps an action in a LiveData for MVVM.
 * This code is not mine! So I did not write tests for this, although I should! :(
 * Credits to Dai and this article (https://android.jlelse.eu/android-arch-handling-clicks-and-single-actions-in-your-view-model-with-livedata-ab93d54bc9dc)
 * Which is kind of similar to what Google used here:
 * https://github.com/android/architecture-samples/blob/dev-todo-mvvm-live/todoapp/app/src/main/java/com/example/android/architecture/blueprints/todoapp/SingleLiveEvent.java
 */
class ActionLiveData<T> : MutableLiveData<T>() {

    @MainThread
    fun sendAction(data: T) {
        value = data
    }

    @MainThread
    override fun observe(owner: LifecycleOwner, observer: Observer<in T>) {
        if (hasObservers()) {
            throw Throwable("Only one observer at a time may subscribe to a ActionLiveData")
        }

        super.observe(owner, Observer { data ->
            if (data != null) {
                observer.onChanged(data)
                value = null
            }
        })
    }
}