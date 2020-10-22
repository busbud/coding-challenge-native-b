package com.ruimendes.busbud.viewmodel

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import androidx.lifecycle.Observer
import com.nhaarman.mockitokotlin2.mock
import com.nhaarman.mockitokotlin2.only
import com.nhaarman.mockitokotlin2.verify
import com.ruimendes.busbud.navigation.Screen
import org.junit.Rule
import org.junit.Test

class StartViewModelTest {

    @get:Rule
    val rule = InstantTaskExecutorRule()

    private val observer = mock<Observer<Screen>>()

    private val viewModel = StartViewModel()

    @Test
    fun `validate when findBusClicked method is called it propagates search screen`() {
        // given
        viewModel.findBusAction.observeForever(observer)
        // when
        viewModel.findBusClicked()
        // then
        verify(observer, only()).onChanged(Screen.SEARCH_ACTIVITY)
    }

}