package com.ruimendes.busbud.viewmodel

import androidx.hilt.lifecycle.ViewModelInject
import androidx.lifecycle.ViewModel
import com.ruimendes.busbud.navigation.Screen
import com.ruimendes.busbud.utils.ActionLiveData

class StartViewModel @ViewModelInject constructor(): ViewModel() {

    val findBusAction = ActionLiveData<Screen>()

    fun findBusClicked() {
        findBusAction.sendAction(Screen.SEARCH_ACTIVITY)
    }
}