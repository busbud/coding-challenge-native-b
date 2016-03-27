package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Prices {

    @JsonProperty("total")
    private int total;

    @JsonProperty("breakdown")
    private Breakdown breakdown;

    @JsonProperty("categories")
    private Object object;

    @JsonProperty("discounted")
    private boolean isDiscounted;

    public Prices() {
    }

    public Prices(int total, Breakdown breakdown, Object object, boolean isDiscounted) {
        this.total = total;
        this.breakdown = breakdown;
        this.object = object;
        this.isDiscounted = isDiscounted;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Breakdown getBreakdown() {
        return breakdown;
    }

    public void setBreakdown(Breakdown breakdown) {
        this.breakdown = breakdown;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public boolean isDiscounted() {
        return isDiscounted;
    }

    public void setDiscounted(boolean discounted) {
        isDiscounted = discounted;
    }
}
