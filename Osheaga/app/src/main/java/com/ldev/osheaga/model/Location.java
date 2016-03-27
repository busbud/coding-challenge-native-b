package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Location {

    @JsonProperty("id")
    private int id;

    @JsonProperty("city_id")
    private String cityId;

    @JsonProperty("name")
    private String name;

    @JsonProperty("adress")
    private ArrayList<String> adress;

    @JsonProperty("type")
    private String type;

    @JsonProperty("lat")
    private long lat;

    @JsonProperty("lon")
    private long lon;

    @JsonProperty("goehash")
    private String geohash;

    public Location() {
    }

    public Location(int id, String cityId, String name, ArrayList<String> adress, String type, long lat, long lon, String geohash) {
        this.id = id;
        this.cityId = cityId;
        this.name = name;
        this.adress = adress;
        this.type = type;
        this.lat = lat;
        this.lon = lon;
        this.geohash = geohash;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<String> getAdress() {
        return adress;
    }

    public void setAdress(ArrayList<String> adress) {
        this.adress = adress;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public long getLat() {
        return lat;
    }

    public void setLat(long lat) {
        this.lat = lat;
    }

    public long getLon() {
        return lon;
    }

    public void setLon(long lon) {
        this.lon = lon;
    }

    public String getGeohash() {
        return geohash;
    }

    public void setGeohash(String geohash) {
        this.geohash = geohash;
    }
}
