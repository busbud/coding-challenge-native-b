package com.filipebrandao.busbudchallenge.ui.main

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import com.filipebrandao.busbudchallenge.R
import com.filipebrandao.busbudchallenge.ui.MainActivity
import com.filipebrandao.busbudchallenge.ui.base.BaseFragment
import com.filipebrandao.busbudchallenge.utils.bindView

class MainFragment : BaseFragment() {

    companion object {
        fun newInstance() = MainFragment()
    }

    private val showDeparturesButton by bindView<Button>(R.id.continue_btn)

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?) = inflater.inflate(R.layout.main_fragment, container, false)!!

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        showDeparturesButton.setOnClickListener {
            (context as MainActivity).showDeparturesList()
        }
    }
}