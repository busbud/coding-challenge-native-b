package com.ruimendes.busbud.ui

import android.app.DatePickerDialog
import android.os.Bundle
import android.view.View
import android.widget.LinearLayout
import android.widget.Toast
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.ruimendes.busbud.R
import com.ruimendes.busbud.ui.adapters.SearchAdapter
import com.ruimendes.busbud.utils.ViewState
import com.ruimendes.busbud.viewmodel.SearchViewModel
import com.scrounger.countrycurrencypicker.library.Country
import com.scrounger.countrycurrencypicker.library.CountryCurrencyPicker
import com.scrounger.countrycurrencypicker.library.Currency
import com.scrounger.countrycurrencypicker.library.Listener.CountryCurrencyPickerListener
import com.scrounger.countrycurrencypicker.library.PickerType
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.android.synthetic.main.activity_search.*
import java.util.*

@AndroidEntryPoint
class SearchActivity : AppCompatActivity() {

    private val viewModel: SearchViewModel by viewModels()

    private val adapter = SearchAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_search)
        setupUI()
        setupObservers()
    }

    private fun setupUI() {
        with(itemsRv) {
            layoutManager = LinearLayoutManager(context)
            adapter = this@SearchActivity.adapter
        }

        currencyTv.setOnClickListener {
            CountryCurrencyPicker.newInstance(
                PickerType.CURRENCY,
                object : CountryCurrencyPickerListener {
                    override fun onSelectCountry(p0: Country) {
                        // do nothing
                    }

                    override fun onSelectCurrency(currency: Currency) {
                        viewModel.onCurrencyUpdated(currency.code)
                    }

                }).show(supportFragmentManager, "CURRENCY_DIALOG")
        }

        datePickerTv.setOnClickListener {
            viewModel.onDatePickerClicked()
        }
    }

    private fun setupObservers() {
        viewModel.viewState.observe(this, Observer { viewState ->
            when (viewState) {
                is ViewState.Loaded -> {
                    resetViews()
                    adapter.submitList(viewState.uiModel)
                }
                is ViewState.Loading -> showLoading()
                is ViewState.Empty -> showEmpty()
                is ViewState.Error -> showError(viewState.errorMessage)
            }

        })

        viewModel.searchToolbarData.observe(this, Observer { searchUIModel ->
            searchTv.text = searchUIModel.searchInfo
            passengersTv.text = searchUIModel.passengers
            datePickerTv.text = searchUIModel.date
            currencyTv.text = searchUIModel.currency
        })

        viewModel.datePickerAction.observe(this, Observer { dateUIModel ->
            val dialog = DatePickerDialog(
                this,
                DatePickerDialog.OnDateSetListener { _, year, monthOfYear, dayOfMonth ->
                    viewModel.onDateUpdated(
                        Calendar.getInstance().apply { set(year, monthOfYear, dayOfMonth) }.time
                    )
                },
                dateUIModel.year,
                dateUIModel.month,
                dateUIModel.day
            )

            dialog.show()
        })
    }

    private fun showLoading() {
        loadingPb.visibility = View.VISIBLE
    }

    private fun hideLoading() {
        loadingPb.visibility = View.GONE
    }

    private fun showEmpty() {
        hideLoading()
        adapter.submitList(emptyList())
        noResultsView.visibility = View.VISIBLE
    }

    private fun hideEmpty() {
        noResultsView.visibility = View.GONE
    }

    private fun showError(errorMessage: String) {
        hideLoading()
        Toast.makeText(this, errorMessage, Toast.LENGTH_SHORT).show()
    }

    private fun resetViews() {
        hideLoading()
        hideEmpty()
    }
}
