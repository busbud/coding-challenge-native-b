package com.ruimendes.busbud.ui


import androidx.test.espresso.intent.Intents
import androidx.test.espresso.intent.Intents.intended
import androidx.test.espresso.intent.matcher.IntentMatchers.hasComponent
import androidx.test.ext.junit.rules.ActivityScenarioRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.ruimendes.busbud.R
import com.ruimendes.busbud.robots.startActivityRobot
import org.junit.After
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class StartActivityTest {

    @get:Rule
    val activityScenario: ActivityScenarioRule<StartActivity> =
        ActivityScenarioRule(StartActivity::class.java)

    @Before
    fun setup() {
        Intents.init()
    }

    @After
    fun teardown() {
        Intents.release()
    }

    @Test
    fun validateCorrectTextIsPresentedOnTheDifferentViews() {
        startActivityRobot {
            assertTitleText(R.string.start_title)
            assertDescriptionText(R.string.start_description)
            assertButtonText(R.string.start_button)
        }
    }

    @Test
    fun validateClickOnButtonSendsUserToSearch() {
        startActivityRobot {
            clickFindBusButton()
        }
        intended(hasComponent(SearchActivity::class.qualifiedName))
    }

}