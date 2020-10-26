package com.ruimendes.busbud.ui.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil.ItemCallback
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import coil.load
import com.ruimendes.busbud.R
import com.ruimendes.busbud.ui.model.DepartureUIModel
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.main.item_departure.view.*

class SearchAdapter : ListAdapter<DepartureUIModel, SearchAdapter.ViewHolder>(DIFF_CALLBACK) {

    companion object {
        val DIFF_CALLBACK = object : ItemCallback<DepartureUIModel>() {

            override fun areItemsTheSame(
                oldItem: DepartureUIModel,
                newItem: DepartureUIModel
            ): Boolean {
                // Not very helpful I know.. but we don't have an unique identifier in this case
                return oldItem == newItem
            }

            override fun areContentsTheSame(
                oldItem: DepartureUIModel,
                newItem: DepartureUIModel
            ): Boolean {
                return oldItem == newItem
            }

        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(
            LayoutInflater
                .from(parent.context)
                .inflate(R.layout.item_departure, parent, false)
        )
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bindView(getItem(position))
    }

    class ViewHolder(override val containerView: View) : RecyclerView.ViewHolder(containerView),
        LayoutContainer {

        fun bindView(departureUIModel: DepartureUIModel) {
            with(containerView) {
                logoIv.load(departureUIModel.operatorLogoUrl) {
                    crossfade(true)
                    placeholder(R.drawable.ic_bus)
                }
                departureTimeTv.text = departureUIModel.departureTime
                departureNameTv.text = departureUIModel.departureName
                arrivalTimeTv.text = departureUIModel.arrivalTime
                arrivalNameTv.text = departureUIModel.arrivalName
                priceTv.text = departureUIModel.price
            }
        }
    }

}