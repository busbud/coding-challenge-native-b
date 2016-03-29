package com.ldev.osheaga.ui.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.ldev.osheaga.R;
import com.ldev.osheaga.model.DataManager;
import com.ldev.osheaga.model.Departure;
import com.ldev.osheaga.model.Location;
import com.ldev.osheaga.model.Operator;
import com.ldev.osheaga.model.XDeparture;
import com.ldev.osheaga.utils.Utils;

import java.util.ArrayList;


public class DepartureAdapter extends RecyclerView.Adapter<DepartureAdapter.ViewHolder> {

    private static String TAG = DepartureAdapter.class.getName();


    private Context context;
    private Departure departure;
    private ArrayList<XDeparture> departures;

    public class ViewHolder extends RecyclerView.ViewHolder {


        public TextView tvSchedule;
        public TextView tvLocationOrigin;
        public TextView tvLocationArrival;
        public TextView tvPrice;
        public ImageView ivDeparture;

        public ViewHolder(View itemView) {
            super(itemView);
            tvSchedule = (TextView) itemView.findViewById(R.id.tvSchedule);
            tvLocationOrigin = (TextView) itemView.findViewById(R.id.tvLocationOrigin);
            tvLocationArrival = (TextView) itemView.findViewById(R.id.tvLocationArrival);
            tvPrice = (TextView) itemView.findViewById(R.id.tvPrice);
            ivDeparture = (ImageView) itemView.findViewById(R.id.ivDeparture);

        }
    }

    public void setDepartures(ArrayList<XDeparture> departures){
        this.departures = departures;
        notifyDataSetChanged();
    }

    public DepartureAdapter(Context context, Departure departure) {
        this.context = context;
        this.departure = departure;
        this.departures = departure.getDepartures();
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.departure_row, parent, false);
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        XDeparture xdeparture = departures.get(position);
        String departureTime = Utils.getTimeFromDate(xdeparture.getDepartureTime());
        String arrivalTime = Utils.getTimeFromDate(xdeparture.getArrivalTime());
        holder.tvSchedule.setText(context.getResources().getString(R.string.schedule_departure, departureTime, arrivalTime));

        String locationOrigin  = getLocationName(xdeparture.getOriginLocationId());
        holder.tvLocationOrigin.setText(Html.fromHtml(context.getResources().getString(R.string.from_location, locationOrigin)));
        String locationArrival = getLocationName(xdeparture.getDestinationId());
        holder.tvLocationArrival.setText(Html.fromHtml(context.getResources().getString(R.string.to_location, locationArrival)));
        String total = Utils.formatTotalWithCurrency(xdeparture.getPrices().getTotal(), DataManager.getInstance().getCurrency());
        holder.tvPrice.setText(total);

        String url = getOperatorUrl(xdeparture.getOperatorId());
        Utils.downloadImage(url, holder.ivDeparture);
    }

    @Override
    public int getItemCount() {
        return departures.size();
    }


    private String getLocationName(int locationId) {
        for (Location location : departure.getLocations()) {
            if (location.getId() == locationId) {
                return location.getName();
            }
        }
        return null;
    }

    private String getOperatorUrl(String operatorId) {
        for (Operator operator : departure.getOperators()) {
            if (operator.getId().equals(operatorId)) {
                return operator.getLogoUrl();
            }
        }
        return null;
    }

}
