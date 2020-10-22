package com.ruimendes.busbud.navigation

import androidx.appcompat.app.AppCompatActivity
import com.ruimendes.busbud.ui.SearchActivity
import com.ruimendes.busbud.ui.StartActivity
import kotlin.reflect.KClass

enum class Screen(val activityClass: Class<out AppCompatActivity>) {
    START_ACTIVITY(StartActivity::class.java),
    SEARCH_ACTIVITY(SearchActivity::class.java)
}