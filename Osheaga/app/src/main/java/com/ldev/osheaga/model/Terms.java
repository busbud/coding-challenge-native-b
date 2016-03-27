package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Terms {

    @JsonProperty("refund")
    private boolean isRefund;

    @JsonProperty("exhange")
    private boolean isExchange;

    @JsonProperty("bag_allowed")
    private boolean isBagAllowed;

    @JsonProperty("piece_of_id")
    private boolean needPieceOfId;

    @JsonProperty("boarding_requirement")
    private String boardingRequirement;

    @JsonProperty("extra_bag_policy")
    private boolean isExtraBagPolicy;

    @JsonProperty("use_new_ticket")
    private  boolean isUseNewTicket;

    @JsonProperty("exchange_cutoff")
    private int exchangeCutOff;

    @JsonProperty("nb_checked_bags")
    private int nbCheckedBags;

    @JsonProperty("kg_by_bag")
    private int kgByBag;

    @JsonProperty("nb_carry_on")
    private int nbCarryOn;

    @JsonProperty("extra_bag_cost")
    private int extraBagCost;

    public Terms() {
    }

    public Terms(boolean isRefund, boolean isExchange, boolean isBagAllowed, boolean needPieceOfId, String boardingRequirement, boolean isExtraBagPolicy, boolean isUseNewTicket, int exchangeCutOff, int nbCheckedBags, int kgByBag, int nbCarryOn, int extraBagCost) {
        this.isRefund = isRefund;
        this.isExchange = isExchange;
        this.isBagAllowed = isBagAllowed;
        this.needPieceOfId = needPieceOfId;
        this.boardingRequirement = boardingRequirement;
        this.isExtraBagPolicy = isExtraBagPolicy;
        this.isUseNewTicket = isUseNewTicket;
        this.exchangeCutOff = exchangeCutOff;
        this.nbCheckedBags = nbCheckedBags;
        this.kgByBag = kgByBag;
        this.nbCarryOn = nbCarryOn;
        this.extraBagCost = extraBagCost;
    }

    public boolean isRefund() {
        return isRefund;
    }

    public void setRefund(boolean refund) {
        isRefund = refund;
    }

    public boolean isExchange() {
        return isExchange;
    }

    public void setExchange(boolean exchange) {
        isExchange = exchange;
    }

    public boolean isBagAllowed() {
        return isBagAllowed;
    }

    public void setBagAllowed(boolean bagAllowed) {
        isBagAllowed = bagAllowed;
    }

    public boolean isNeedPieceOfId() {
        return needPieceOfId;
    }

    public void setNeedPieceOfId(boolean needPieceOfId) {
        this.needPieceOfId = needPieceOfId;
    }

    public String getBoardingRequirement() {
        return boardingRequirement;
    }

    public void setBoardingRequirement(String boardingRequirement) {
        this.boardingRequirement = boardingRequirement;
    }

    public boolean isExtraBagPolicy() {
        return isExtraBagPolicy;
    }

    public void setExtraBagPolicy(boolean extraBagPolicy) {
        isExtraBagPolicy = extraBagPolicy;
    }

    public boolean isUseNewTicket() {
        return isUseNewTicket;
    }

    public void setUseNewTicket(boolean useNewTicket) {
        isUseNewTicket = useNewTicket;
    }

    public int getExchangeCutOff() {
        return exchangeCutOff;
    }

    public void setExchangeCutOff(int exchangeCutOff) {
        this.exchangeCutOff = exchangeCutOff;
    }

    public int getNbCheckedBags() {
        return nbCheckedBags;
    }

    public void setNbCheckedBags(int nbCheckedBags) {
        this.nbCheckedBags = nbCheckedBags;
    }

    public int getKgByBag() {
        return kgByBag;
    }

    public void setKgByBag(int kgByBag) {
        this.kgByBag = kgByBag;
    }

    public int getNbCarryOn() {
        return nbCarryOn;
    }

    public void setNbCarryOn(int nbCarryOn) {
        this.nbCarryOn = nbCarryOn;
    }

    public int getExtraBagCost() {
        return extraBagCost;
    }

    public void setExtraBagCost(int extraBagCost) {
        this.extraBagCost = extraBagCost;
    }
}
