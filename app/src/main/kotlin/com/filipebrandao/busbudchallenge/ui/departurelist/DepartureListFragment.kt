package com.filipebrandao.busbudchallenge.ui.departurelist

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import androidx.constraintlayout.widget.Group
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.filipebrandao.busbudchallenge.R
import com.filipebrandao.busbudchallenge.ui.base.BaseFragment
import com.filipebrandao.busbudchallenge.ui.departurelist.model.FetchDeparturesUiResult
import com.filipebrandao.busbudchallenge.utils.bindView
import org.koin.androidx.viewmodel.ext.android.stateViewModel
import org.threeten.bp.LocalDate

class DepartureListFragment : BaseFragment() {

    companion object {
        private const val TAG = "DepartureListFragment"
        private const val ORIGIN_GEOHASH = "f2m673"
        private const val DESTINATION_GEOHASH = "f25dvk"
        private val OUTBOUND_DATE = LocalDate.of(2021, 8, 28)
        private const val NUMBER_OF_ADULTS = 1

        fun newInstance() = DepartureListFragment()
    }

    private val viewModel: DepartureListViewModel by stateViewModel()
    private val recyclerView by bindView<RecyclerView>(R.id.recyclerview)
    private val progressBar by bindView<ProgressBar>(R.id.loading)
    private val errorView by bindView<Group>(R.id.error_group)


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        return inflater.inflate(R.layout.departures_list_fragment, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupRecyclerView()
        // trigger departure fetching
        viewModel.fetchDepartures(ORIGIN_GEOHASH, DESTINATION_GEOHASH, OUTBOUND_DATE, NUMBER_OF_ADULTS)
    }

    private fun setupRecyclerView() {
        val departureListAdapter = DepartureListAdapter()
        recyclerView.adapter = departureListAdapter
        recyclerView.layoutManager = LinearLayoutManager(context)

        // observer the departures exposed by the viewmodel
        viewModel.departures.observe(
            viewLifecycleOwner,
            {
                progressBar.visibility = View.GONE
                if (it is FetchDeparturesUiResult.Success) {
                    logger.d(TAG, " Fetched departures successfully")
                    // update the list adapter
                    departureListAdapter.submitList(it.departures)
                } else {
                    logger.w(TAG, "Fetched departures with error")
                    // show the error view
                    recyclerView.visibility = View.GONE
                    errorView.visibility = View.VISIBLE
                }
            }
        )
    }

}