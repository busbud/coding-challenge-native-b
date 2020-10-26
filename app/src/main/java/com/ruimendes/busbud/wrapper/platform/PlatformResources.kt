package com.ruimendes.busbud.wrapper.platform

import android.content.Context

class PlatformResources(private val context: Context) : ResourcesInterface {

    override fun getStringResource(identifier: Int): String {
        return context.getString(identifier)
    }

}