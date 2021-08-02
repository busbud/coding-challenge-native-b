package com.filipebrandao.busbudchallenge.ui.departurelist

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import coil.load
import com.filipebrandao.busbudchallenge.R
import com.filipebrandao.busbudchallenge.ui.departurelist.model.DepartureUiModel
import com.filipebrandao.busbudchallenge.utils.bindView

class DepartureListAdapter : ListAdapter<DepartureUiModel, DepartureListAdapter.ViewHolder>(DIFF_CALLBACK) {

    companion object {
        val DIFF_CALLBACK = object : DiffUtil.ItemCallback<DepartureUiModel>() {

            override fun areItemsTheSame(oldItem: DepartureUiModel, newItem: DepartureUiModel): Boolean {
                return oldItem.id == newItem.id
            }

            override fun areContentsTheSame(oldItem: DepartureUiModel, newItem: DepartureUiModel): Boolean {
                return oldItem.id == newItem.id
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder = ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.list_item_departure, parent, false))

    override fun onBindViewHolder(holder: ViewHolder, position: Int) = holder.bind(getItem(position))

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {

        private val operatorImageView by bindView<ImageView>(R.id.operator_iv)
        private val departureTimeTextView by bindView<TextView>(R.id.departure_time_tv)
        private val departureCityTextView by bindView<TextView>(R.id.departure_city_tv)
        private val departureLocationTextView by bindView<TextView>(R.id.departure_location_tv)
        private val arrivalTimeTextView by bindView<TextView>(R.id.arrival_time_tv)
        private val arrivalCityTextView by bindView<TextView>(R.id.arrival_city_tv)
        private val arrivalLocationTextView by bindView<TextView>(R.id.arrival_location_tv)
        private val priceTextView by bindView<TextView>(R.id.price_tv)


        fun bind(departure: DepartureUiModel) = with(departure) {
            operatorImageView.load(operatorImageUrl)

            departureTimeTextView.text = departureTime
            departureCityTextView.text = departureCity
            if (departureLocation.isNullOrBlank()) {
                departureLocationTextView.visibility = View.INVISIBLE
            } else {
                departureLocationTextView.text = departureLocation
                departureLocationTextView.visibility = View.VISIBLE
            }

            arrivalTimeTextView.text = arrivalTime
            arrivalCityTextView.text = arrivalCity

            if (arrivalLocation.isNullOrBlank()) {
                arrivalLocationTextView.visibility = View.INVISIBLE
            } else {
                arrivalLocationTextView.text = arrivalLocation
                arrivalLocationTextView.visibility = View.VISIBLE
            }
            departureLocationTextView.text = departureLocation

            priceTextView.text = price
        }
    }

}