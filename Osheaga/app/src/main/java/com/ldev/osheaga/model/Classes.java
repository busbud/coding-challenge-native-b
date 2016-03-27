package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Classes {

    @JsonProperty("Normal")
    private Amenity normalAmenity;

    @JsonProperty("Economy")
    private Amenity economyAmenity;

    public Classes() {
    }

    public Classes(Amenity normalAmenity, Amenity economyAmenity) {
        this.normalAmenity = normalAmenity;
        this.economyAmenity = economyAmenity;
    }

    public Amenity getNormalAmenity() {
        return normalAmenity;
    }

    public void setNormalAmenity(Amenity normalAmenity) {
        this.normalAmenity = normalAmenity;
    }

    public Amenity getEconomyAmenity() {
        return economyAmenity;
    }

    public void setEconomyAmenity(Amenity economyAmenity) {
        this.economyAmenity = economyAmenity;
    }
}
