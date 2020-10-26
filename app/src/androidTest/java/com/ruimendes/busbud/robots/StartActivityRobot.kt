package com.ruimendes.busbud.robots

import androidx.test.espresso.Espresso.onView
import androidx.test.espresso.action.ViewActions.click
import androidx.test.espresso.assertion.ViewAssertions.matches
import androidx.test.espresso.matcher.ViewMatchers.withId
import androidx.test.espresso.matcher.ViewMatchers.withText
import com.ruimendes.busbud.R

class StartActivityRobot {

    private companion object {
        const val TITLE = R.id.titleTv
        const val DESCRIPTION = R.id.descriptionTv
        const val CONTINUE_BUTTON = R.id.continueBtn
    }

    fun assertTitleText(stringResId: Int) {
        onView(withId(TITLE)).check(matches(withText(stringResId)))
    }

    fun assertDescriptionText(stringResId: Int) {
        onView(withId(DESCRIPTION)).check(matches(withText(stringResId)))
    }

    fun assertButtonText(stringResId: Int) {
        onView(withId(CONTINUE_BUTTON)).check(matches(withText(stringResId)))
    }

    fun clickFindBusButton() {
        onView(withId(CONTINUE_BUTTON)).perform(click())
    }
}

fun startActivityRobot(body: StartActivityRobot.() -> Unit) = StartActivityRobot().apply(body)