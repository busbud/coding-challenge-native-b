package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class City {

    @JsonProperty("id")
    private String id ;

    @JsonProperty("locale")
    private String locale;

    @JsonProperty("region_id")
    private int regionID;

    @JsonProperty("name")
    private String name;

    @JsonProperty("lat")
    private long lag;

    @JsonProperty("lon")
    private long lon;

    @JsonProperty("geohash")
    private String geohash;

    @JsonProperty("timezone")
    private String timezone;

    @JsonProperty("image_url")
    private String imageUrl;

    @JsonProperty("hero_image_url")
    private String heroImageUrl;

    @JsonProperty("legacy_url_form")
    private String legacyUrlForm;

    @JsonProperty("full_name")
    private String fullName;

    @JsonProperty("region")
    private Region region;


    public City() {
    }

    public City(String id, String locale, int regionID, String name, long lag, long lon, String geohash, String timezone, String imageUrl, String heroImageUrl, String legacyUrlForm, String fullName, Region region) {
        this.id = id;
        this.locale = locale;
        this.regionID = regionID;
        this.name = name;
        this.lag = lag;
        this.lon = lon;
        this.geohash = geohash;
        this.timezone = timezone;
        this.imageUrl = imageUrl;
        this.heroImageUrl = heroImageUrl;
        this.legacyUrlForm = legacyUrlForm;
        this.fullName = fullName;
        this.region = region;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public int getRegionID() {
        return regionID;
    }

    public void setRegionID(int regionID) {
        this.regionID = regionID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getLag() {
        return lag;
    }

    public void setLag(long lag) {
        this.lag = lag;
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

    public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getHeroImageUrl() {
        return heroImageUrl;
    }

    public void setHeroImageUrl(String heroImageUrl) {
        this.heroImageUrl = heroImageUrl;
    }

    public String getLegacyUrlForm() {
        return legacyUrlForm;
    }

    public void setLegacyUrlForm(String legacyUrlForm) {
        this.legacyUrlForm = legacyUrlForm;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
}
