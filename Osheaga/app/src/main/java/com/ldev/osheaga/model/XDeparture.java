package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;

@JsonIgnoreProperties(ignoreUnknown = true)
public class XDeparture {

    @JsonProperty("id")
    private String id;

    @JsonProperty("source_id")
    private int sourceId;

    @JsonProperty("checkout_type")
    private String checkoutType;

    @JsonProperty("operator_id")
    private String operatorId;

    @JsonProperty("origin_location_id")
    private int originLocationId;

    @JsonProperty("destination_location_id")
    private int destinationId;

    @JsonProperty("class")
    private String classType;

    @JsonProperty("class_name")
    private String className;

    @JsonProperty("amenities")
    private Amenity amenity;

    @JsonProperty("available_seats")
    private int availableSeats;

    @JsonProperty("prices")
    private Prices prices;

    @JsonProperty("ticket_types")
    private ArrayList<String> ticketTypes;

    @JsonProperty("departure_timezone")
    private String departureTimeZone;

    @JsonProperty("arrival_timezone")
    private String arrivalTimeZone;

    @JsonProperty("departure_time")
    private String departureTime;

    @JsonProperty("arrival_time")
    private String arrivalTime;

    public XDeparture() {
    }

    public XDeparture(String id, int sourceId, String checkoutType, String operatorId, int originLocationId, int destinationId, String classType, String className, Amenity amenity, int availableSeats, Prices prices, ArrayList<String> ticketTypes, String departureTimeZone, String arrivalTimeZone, String departureTime, String arrivalTime) {
        this.id = id;
        this.sourceId = sourceId;
        this.checkoutType = checkoutType;
        this.operatorId = operatorId;
        this.originLocationId = originLocationId;
        this.destinationId = destinationId;
        this.classType = classType;
        this.className = className;
        this.amenity = amenity;
        this.availableSeats = availableSeats;
        this.prices = prices;
        this.ticketTypes = ticketTypes;
        this.departureTimeZone = departureTimeZone;
        this.arrivalTimeZone = arrivalTimeZone;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public String getCheckoutType() {
        return checkoutType;
    }

    public void setCheckoutType(String checkoutType) {
        this.checkoutType = checkoutType;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public int getOriginLocationId() {
        return originLocationId;
    }

    public void setOriginLocationId(int originLocationId) {
        this.originLocationId = originLocationId;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Amenity getAmenity() {
        return amenity;
    }

    public void setAmenity(Amenity amenity) {
        this.amenity = amenity;
    }

    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    public Prices getPrices() {
        return prices;
    }

    public void setPrices(Prices prices) {
        this.prices = prices;
    }

    public ArrayList<String> getTicketTypes() {
        return ticketTypes;
    }

    public void setTicketTypes(ArrayList<String> ticketTypes) {
        this.ticketTypes = ticketTypes;
    }

    public String getDepartureTimeZone() {
        return departureTimeZone;
    }

    public void setDepartureTimeZone(String departureTimeZone) {
        this.departureTimeZone = departureTimeZone;
    }

    public String getArrivalTimeZone() {
        return arrivalTimeZone;
    }

    public void setArrivalTimeZone(String arrivalTimeZone) {
        this.arrivalTimeZone = arrivalTimeZone;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getDestinationId() {
        return destinationId;
    }

    public void setDestinationId(int destinationId) {
        this.destinationId = destinationId;
    }
}
