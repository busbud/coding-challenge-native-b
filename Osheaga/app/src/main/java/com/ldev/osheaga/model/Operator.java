package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Operator {

    @JsonProperty("id")
    private String id;

    @JsonProperty("source_id")
    private int sourceId;

    @JsonProperty("profile_id")
    private int profileId;

    @JsonProperty("name")
    private String name;

    @JsonProperty("url")
    private String url;

    @JsonProperty("logo_url")
    private String logoUrl;

    @JsonProperty("display_name")
    private String displayName;

    @JsonProperty("sellable")
    private boolean sellable;

    @JsonProperty("fuzzy_prices")
    private boolean fuzzyPrices;

    @JsonProperty("sell_tickets_cutoff")
    private SellTicketsCutOff sellTicketsCutOff;

    @JsonProperty("amenities")
    private Amenities amenities;

    @JsonProperty("source")
    private String source;

    @JsonProperty("referral_deal")
    private boolean isReferralDeal;

    @JsonProperty("display_url")
    private String displayUrl;

    @JsonProperty("fraud_check")
    private String fraudCheck;

    @JsonProperty("terms")
    private Terms terms;


    public Operator() {
    }

    public Operator(String id, int sourceId, int profileId, String name, String url, String logoUrl, String displayName, boolean sellable, boolean fuzzyPrices, SellTicketsCutOff sellTicketsCutOff, Amenities amenities, String source, boolean isReferralDeal, String displayUrl, String fraudCheck, Terms terms) {
        this.id = id;
        this.sourceId = sourceId;
        this.profileId = profileId;
        this.name = name;
        this.url = url;
        this.logoUrl = logoUrl;
        this.displayName = displayName;
        this.sellable = sellable;
        this.fuzzyPrices = fuzzyPrices;
        this.sellTicketsCutOff = sellTicketsCutOff;
        this.amenities = amenities;
        this.source = source;
        this.isReferralDeal = isReferralDeal;
        this.displayUrl = displayUrl;
        this.fraudCheck = fraudCheck;
        this.terms = terms;
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

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public boolean isSellable() {
        return sellable;
    }

    public void setSellable(boolean sellable) {
        this.sellable = sellable;
    }

    public boolean isFuzzyPrices() {
        return fuzzyPrices;
    }

    public void setFuzzyPrices(boolean fuzzyPrices) {
        this.fuzzyPrices = fuzzyPrices;
    }

    public SellTicketsCutOff getSellTicketsCutOff() {
        return sellTicketsCutOff;
    }

    public void setSellTicketsCutOff(SellTicketsCutOff sellTicketsCutOff) {
        this.sellTicketsCutOff = sellTicketsCutOff;
    }

    public Amenities getAmenities() {
        return amenities;
    }

    public void setAmenities(Amenities amenities) {
        this.amenities = amenities;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public boolean isReferralDeal() {
        return isReferralDeal;
    }

    public void setReferralDeal(boolean referralDeal) {
        isReferralDeal = referralDeal;
    }

    public String getDisplayUrl() {
        return displayUrl;
    }

    public void setDisplayUrl(String displayUrl) {
        this.displayUrl = displayUrl;
    }

    public String getFraudCheck() {
        return fraudCheck;
    }

    public void setFraudCheck(String fraudCheck) {
        this.fraudCheck = fraudCheck;
    }

    public Terms getTerms() {
        return terms;
    }

    public void setTerms(Terms terms) {
        this.terms = terms;
    }
}
