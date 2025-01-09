# Busbud mobile app coding challenge

Write a native app that uses Busbud's API to display a list of nearby cities.

## Features

### List view

The main view of the app is a list of nearby cities.

For each city, the list should show:
* The city name
* The distance from the current location

The list should be sorted by distance, with the nearest city at the top.

### Detail view

Users should be able to select a city and see a detail view containing:
* The city name
* The state / province / region
* The country
* The distance from the current location
* A map centered on the city
* A button that opens that city's page on the Busbud website in a web browser, e.g. `https://www.busbud.com/en/c/f25dvk` (the last path component is the city's 6-character geohash)

---

## Requirements

### General

The app should:
* be written in Swift (iOS) or Kotlin (Android)
* be localized in English and at least one other language of your choice
* be compatible with dark mode
* include tests

The app does not need to:
* have an app icon
* support OS versions older than iOS 18.0

### Challenge submission

The challenge is submitted as pull request against this repo ([fork it](https://help.github.com/articles/fork-a-repo/) and [create a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)).

You should plan to spend around 3 to 4 hours working on this project. Here's what we'll be looking for when we review your submission:
* clean, concise, readable, production-quality code
* an appropriate level of complexity (do not over-engineer)
* thoughtful use of system libraries (do not reinvent the wheel)
* plain design (this is an engineering challenge)
* adequate tests

The pull request description should include:
* a brief description of your work
* screenshots

---

## Supporting API

In order to complete this challenge, you will be making requests to `napi.busbud.com`, Busbud's production API.  
The endpoint used to fetch nearby cities is:
`GET https://napi.busbud.com/flex/suggestions/points-of-interest`.

### Query parameters

Parameter | Example value | Notes
--- | --- | ---
`lat` | `45.51` | Latitude (in decimal degrees)
`lon` | `-73.59` | Longitude (in decimal degrees)
`limit` | `25` | The maximum number of results
`lang` | `en` | The language in which the city names should be returned

The available values of `lang` are:
* `de`: German
* `en`: English - United States of America
* `en-ca`: English - Canada
* `en-gb`: English - Great Britain
* `es`: Spanish - Spain
* `es-mx`: Spanish - Mexico
* `es-419`: Spanish - Latin America and Caribbean region
* `fr`: French - France
* `fr-ca`: French - Canada
* `it`: Italian
* `nl`: Dutch
* `pl`: Polish
* `pt`: Portuguese - Brazil
* `pt-pt`: Portuguese - Portugal
* `ru`: Russian
* `sv`: Swedish
* `tr`: Turkish
* `zh`: Chinese

### Headers

Header | Value
--- | ---
Accept | `application/vnd.busbud+json; version=3; profile=https://schema.busbud.com/v3/anything.json`

### Sample response

```json
{
  "suggestions": [
    {
      "provider": "places",
      "id": "375dd587-9001-acbd-84a4-683dedfb933e",
      "place_id": "375dd587-9001-acbd-84a4-683dedfb933e",
      "geo_entity_id": "375dd587-9001-acbd-84a4-683dedfb933e",
      "parent_id": null,
      "label": "Montreal",
      "score": 7881.816985404749,
      "place_type": "city",
      "stop_type": "other",
      "url": "Montreal,Quebec,Canada",
      "geohash": "f25dvk",
      "lat": 45.50884,
      "lon": -73.58781,
      "hierarchy_info": {
        "country": {
          "code": "CA",
          "name": "Canada"
        },
        "region": {
          "code": "QC",
          "name": "Quebec"
        }
      },
      "city_name": "Montreal",
      "region_name": "Quebec",
      "country_name": "Canada",
      "full_name": "Montreal, Quebec, Canada",
      "short_name": "Montreal",
      "request_id": "2024111318429c825259209202727bb3ab9ecffd2b52a093d39675db5258fdc0ebb40cb97a25"
    }
  ],
  "parents": {},
  "siblings": {},
  "results_type": "prefix"
}
```
