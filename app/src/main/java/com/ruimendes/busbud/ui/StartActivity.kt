package com.ruimendes.busbud.ui

import android.content.Intent
import android.os.Bundle
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import com.ruimendes.busbud.R
import com.ruimendes.busbud.viewmodel.SearchViewModel
import com.ruimendes.busbud.viewmodel.StartViewModel
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.android.synthetic.main.activity_start.*

@AndroidEntryPoint
class StartActivity : AppCompatActivity() {

    private val viewModel: StartViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_start)
        setupUI()
        setupObservers()
    }

    private fun setupUI() {
        continueBtn.setOnClickListener {
            viewModel.findBusClicked()
        }
    }

    private fun setupObservers() {
        viewModel.findBusAction.observe(this, Observer { screen ->
            startActivity(Intent(this, screen.activityClass))
        })
    }

}