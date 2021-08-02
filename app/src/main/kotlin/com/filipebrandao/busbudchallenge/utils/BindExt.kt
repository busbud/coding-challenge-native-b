package com.filipebrandao.busbudchallenge.utils

import android.app.Activity
import android.view.View
import androidx.annotation.IdRes
import androidx.fragment.app.DialogFragment
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.recyclerview.widget.RecyclerView
import kotlin.properties.ReadOnlyProperty
import kotlin.reflect.KProperty


// Based on https://www.lordcodes.com/articles/using-kotlin-to-bind-android-views

// Optimizes lazy loading by disregarding the thread-safety when we are completely sure about the thread-safety of our code
fun <T> lazyUnsynchronized(initializer: () -> T): Lazy<T> = lazy(LazyThreadSafetyMode.NONE, initializer)

// Lazy view binding in Activities
fun <ViewT : View> Activity.bindView(@IdRes viewId: Int): Lazy<ViewT> {
    return lazyUnsynchronized {
        findViewById<ViewT>(viewId)
    }
}

// Lazy view binding inside Views
fun <ViewT : View> View.bindView(@IdRes viewId: Int): Lazy<ViewT> {
    return lazyUnsynchronized {
        findViewById<ViewT>(viewId)
    }
}

// Lazy view binding in ViewHolders
fun <ViewT : View> RecyclerView.ViewHolder.bindView(@IdRes viewId: Int): Lazy<ViewT> {
    return lazyUnsynchronized {
        itemView.findViewById<ViewT>(viewId)
    }
}

fun <ViewT : View> DialogFragment.bindView(@IdRes viewId: Int): ReadOnlyProperty<DialogFragment, ViewT> {
    return FragmentBinder(this) {
        dialog!!.findViewById<ViewT>(viewId)
    }
}

fun <ViewT : View> Fragment.bindView(@IdRes viewId: Int): ReadOnlyProperty<Fragment, ViewT> {
    return FragmentBinder(this) {
        it.requireView().findViewById<ViewT>(viewId)
    }
}

private class FragmentBinder<out ViewT : View>(
    val fragment: Fragment,
    val initializer: (Fragment) -> ViewT
) : ReadOnlyProperty<Fragment, ViewT>, LifecycleObserver {
    private object EMPTY

    private var viewValue: Any? = EMPTY

    init {
        fragment.viewLifecycleOwnerLiveData.observe(
            fragment,
            {
                it.lifecycle.addObserver(this)
            }
        )
    }

    override fun getValue(thisRef: Fragment, property: KProperty<*>): ViewT {
        if (viewValue === EMPTY) {
            viewValue = initializer(fragment)
        }
        @Suppress("UNCHECKED_CAST")
        return viewValue as ViewT
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onViewDestroyed() {
        viewValue = EMPTY
    }
}
