package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Departure {

    @JsonProperty("origin_city_id")
    private String originCityId;

    @JsonProperty("destination_city_id")
    private String destinationCityId;

    @JsonProperty("cities")
    private ArrayList<City> cities;

    @JsonProperty("locations")
    private ArrayList<Location> locations;

    @JsonProperty("operators")
    private ArrayList<Operator> operators;

    @JsonProperty("departures")
    private ArrayList<XDeparture> departures;

    @JsonProperty("complete")
    private boolean complete;

    @JsonProperty("ttl")
    private int ttl;

    @JsonProperty("is_valid_route")
    private boolean isValideRoute;

    public Departure() {
    }

    public Departure(String originCityId, String destinationCityId, ArrayList<City> cities, ArrayList<Location> locations, ArrayList<Operator> operators, ArrayList<XDeparture> departures, boolean complete, int ttl, boolean isValideRoute) {
        this.originCityId = originCityId;
        this.destinationCityId = destinationCityId;
        this.cities = cities;
        this.locations = locations;
        this.operators = operators;
        this.departures = departures;
        this.complete = complete;
        this.ttl = ttl;
        this.isValideRoute = isValideRoute;
    }

    public String getOriginCityId() {
        return originCityId;
    }

    public void setOriginCityId(String originCityId) {
        this.originCityId = originCityId;
    }

    public String getDestinationCityId() {
        return destinationCityId;
    }

    public void setDestinationCityId(String destinationCityId) {
        this.destinationCityId = destinationCityId;
    }

    public ArrayList<City> getCities() {
        return cities;
    }

    public void setCities(ArrayList<City> cities) {
        this.cities = cities;
    }

    public ArrayList<Location> getLocations() {
        return locations;
    }

    public void setLocations(ArrayList<Location> locations) {
        this.locations = locations;
    }

    public ArrayList<Operator> getOperators() {
        return operators;
    }

    public void setOperators(ArrayList<Operator> operators) {
        this.operators = operators;
    }

    public ArrayList<XDeparture> getDepartures() {
        return departures;
    }

    public void setDepartures(ArrayList<XDeparture> departures) {
        this.departures = departures;
    }

    public boolean isComplete() {
        return complete;
    }

    public void setComplete(boolean complete) {
        this.complete = complete;
    }

    public int getTtl() {
        return ttl;
    }

    public void setTtl(int ttl) {
        this.ttl = ttl;
    }

    public boolean isValideRoute() {
        return isValideRoute;
    }

    public void setValideRoute(boolean valideRoute) {
        isValideRoute = valideRoute;
    }
}
