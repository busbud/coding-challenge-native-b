package com.ldev.osheaga.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Region {

    @JsonProperty("id")
    private int id;

    @JsonProperty("locale")
    private String locale;

    @JsonProperty("country_code")
    private String countryCode;

    @JsonProperty("name")
    private String name;

    @JsonProperty("continent")
    private String continent;

    @JsonProperty("default_local")
    private String defaultLocal;

    @JsonProperty("default_currency")
    private String defaultCurrency;

    @JsonProperty("population")
    private int nbrPopulation;

    public Region() {
    }

    public Region(int id, String locale, String countryCode, String name, String continent, String defaultLocal, String defaultCurrency, int nbrPopulation) {
        this.id = id;
        this.locale = locale;
        this.countryCode = countryCode;
        this.name = name;
        this.continent = continent;
        this.defaultLocal = defaultLocal;
        this.defaultCurrency = defaultCurrency;
        this.nbrPopulation = nbrPopulation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContinent() {
        return continent;
    }

    public void setContinent(String continent) {
        this.continent = continent;
    }

    public String getDefaultLocal() {
        return defaultLocal;
    }

    public void setDefaultLocal(String defaultLocal) {
        this.defaultLocal = defaultLocal;
    }

    public String getDefaultCurrency() {
        return defaultCurrency;
    }

    public void setDefaultCurrency(String defaultCurrency) {
        this.defaultCurrency = defaultCurrency;
    }

    public int getNbrPopulation() {
        return nbrPopulation;
    }

    public void setNbrPopulation(int nbrPopulation) {
        this.nbrPopulation = nbrPopulation;
    }
}
