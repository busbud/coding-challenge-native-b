package com.filipebrandao.busbudchallenge.ui

import android.os.Bundle
import androidx.appcompat.widget.Toolbar
import com.filipebrandao.busbudchallenge.R
import com.filipebrandao.busbudchallenge.ui.base.BaseActivity
import com.filipebrandao.busbudchallenge.ui.departurelist.DepartureListFragment
import com.filipebrandao.busbudchallenge.ui.main.MainFragment
import com.filipebrandao.busbudchallenge.utils.bindView
import com.google.android.material.appbar.AppBarLayout

class MainActivity : BaseActivity() {

    private val toolbar by bindView<Toolbar>(R.id.toolbar)
    private val appbarLayout by bindView<AppBarLayout>(R.id.appbarlayout)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.main_activity)

        setSupportActionBar(toolbar)

        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(R.id.container, MainFragment.newInstance())
                .commitNow()
        }
    }

    fun showDeparturesList() {
        val departureListFragment = DepartureListFragment.newInstance()
        supportFragmentManager.beginTransaction()
            .replace(R.id.container, departureListFragment)
            .addToBackStack(departureListFragment.tag)
            .commit()
    }

    override fun onBackPressed() {
        super.onBackPressed()
        // show toolbar when going back to the first screen
        appbarLayout.setExpanded(true, false)
    }

}