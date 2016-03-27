package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PollDeparture {

    @JsonProperty("operators")
    private ArrayList<Operator> operators;

    @JsonProperty("departures")
    private ArrayList<XDeparture> departures;

    @JsonProperty("complete")
    private boolean complete;

    @JsonProperty("ttl")
    private int ttl;

    public PollDeparture() {
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
}
