package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Amenity {

    @JsonProperty("display_name")
    private String diplayName;

    @JsonProperty("wifi")
    private boolean isWifi;

    @JsonProperty("toilet")
    private boolean isToilet;

    @JsonProperty("ac")
    private boolean isAc;

    @JsonProperty("food")
    private boolean isFood;

    @JsonProperty("refreshment")
    private boolean isRefreshment;

    @JsonProperty("power_outlets")
    private boolean isPowerOutlets;

    @JsonProperty("tv")
    private boolean isTv;

    @JsonProperty("bus_attendant")
    private boolean isBusAttendant;

    @JsonProperty("leg_room")
    private boolean isLegRoom;

    public Amenity() {
    }

    public Amenity(String diplayName, boolean isWifi, boolean isToilet, boolean isAc, boolean isFood, boolean isRefreshment, boolean isPowerOutlets, boolean isTv, boolean isBusAttendant, boolean isLegRoom) {
        this.diplayName = diplayName;
        this.isWifi = isWifi;
        this.isToilet = isToilet;
        this.isAc = isAc;
        this.isFood = isFood;
        this.isRefreshment = isRefreshment;
        this.isPowerOutlets = isPowerOutlets;
        this.isTv = isTv;
        this.isBusAttendant = isBusAttendant;
        this.isLegRoom = isLegRoom;
    }

    public String getDiplayName() {
        return diplayName;
    }

    public void setDiplayName(String diplayName) {
        this.diplayName = diplayName;
    }

    public boolean isWifi() {
        return isWifi;
    }

    public void setWifi(boolean wifi) {
        isWifi = wifi;
    }

    public boolean isToilet() {
        return isToilet;
    }

    public void setToilet(boolean toilet) {
        isToilet = toilet;
    }

    public boolean isAc() {
        return isAc;
    }

    public void setAc(boolean ac) {
        isAc = ac;
    }

    public boolean isFood() {
        return isFood;
    }

    public void setFood(boolean food) {
        isFood = food;
    }

    public boolean isRefreshment() {
        return isRefreshment;
    }

    public void setRefreshment(boolean refreshment) {
        isRefreshment = refreshment;
    }

    public boolean isPowerOutlets() {
        return isPowerOutlets;
    }

    public void setPowerOutlets(boolean powerOutlets) {
        isPowerOutlets = powerOutlets;
    }

    public boolean isTv() {
        return isTv;
    }

    public void setTv(boolean tv) {
        isTv = tv;
    }

    public boolean isBusAttendant() {
        return isBusAttendant;
    }

    public void setBusAttendant(boolean busAttendant) {
        isBusAttendant = busAttendant;
    }

    public boolean isLegRoom() {
        return isLegRoom;
    }

    public void setLegRoom(boolean legRoom) {
        isLegRoom = legRoom;
    }
}
