##Solution

###Third party libraries
- Alamofire
- SwiftyJSON
- MBProgressHUD

These libraries are to be imported using Cocoapods. Run `pod install` before opening the project.

###Features

The app lets users search for one-way bus routes between New York and Montreal. They can pick the date, but the default is July 29, 2016. They can also choose a currency (the default is US Dollars).
Once the user taps the 'Search' button, the app displays a spinner to indicate that the request is being processed. After a few moments, the user is presented with a list of bus routes. For each route, the app provides the names of the origin and arrival locations, the times, the operator, and the price.

###Structure

The `Client` class contains everything that's needed to communicate with the API. All of the funcionality is achieved using static functions and constants, so there is no need to create an instance of `Client`.

The major issue I ran into was the API's unusual polling mechanism. In order to acommodate this, the `searchDepartures` function calls itself recursively, passing the already parsed content as function parameters. After it parses the last JSON payload, it calls the `success` closure. If something goes sideways at any point, it calls the `failure` closure instead, and passes the relevant `NSError` as a parameter.

I created model classes for `City`, `Location`, `Departure`, and `Operator`. I didn't implement all their properties, only those I needed. These model classes can be instantiated from JSON using `SwiftyJSON`.	

For the UI, I decided to use a storyboard. I like how it provides a preview of how the app flows. There are 2 view controllers: `StartViewController` and `SearchResultsViewController`. The app transitions between them using a standard `UINavigationController`. In `StartViewController`, I used a `UIStackView` to achieve a clean and versatile layout. To display the results, I created a custom `UITableViewCell` subclass that handles the formatting. All the layouts are defined using Autolayout constraints, so they display properly on all iPhone screen sizes.

A few more things I did:

- Extended `NSDate` to conform to the `Comparable` protocol, for easier sorting of search results.
- Created a file where all the data formatters live (for dates and currency).
- Created a custom `BusbudError` struct that can create `NSError` instances with custom codes.

###Improvements

- Given more time, I would have liked to take the time to implement proper localization, using `NSLocalizedString` and a strings file.
- There is currently no time zone support, but it was unneccessary for this particular challenge.
- In a production environment, I would write unit tests for the JSON parsing.
- I would also have liked to let users choose their origin and destination cities, but that part of the API is not documented.
- Finally, it would have been cool to have a detail view for each search result, with more details and maybe a map.

##Original challenge

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

Hey! 

It will be hot this summer in Montreal with the [Osheaga festival](http://www.osheaga.com/)! 
Your challenge is to build a promotional app that allows a traveler from NYC to find one-way departure schedules for the festival's opening weekend.

### Requirements

Write a native Busbud app that:

- Has a simple onboarding screen that will open the search
- Lists all the departures for a given origin city (**New York - geohash: dr5reg**) and a given destination city (**Montréal - geohash: f25dvk**) for a given day (**the 29th of July 2016**) for **1** adult. 
For each item, we want, at least, to see the **departure time**, the **arrival time**, the **location name** and the **price** (use `prices.total` of the `departure`).

### Non-functional requirements

- The code should be hosted on github, and the repo should be shared with Busbud and submitted as a pull request
- The repo should include 3 screenshots under the /screenshots folder to show the app usage.
- Change the README.md to explain your solution, the issues, the way you solved them...

### Supporting API

For all these requests, you MUST change the Accept header to:
`application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/`

### Init results

To get departure results, search is initialized via the following endpoint:

`https://napi.busbud.com/x-departures/:origin/:destination/:outbound_date`

PATH PARAMS  

`origin` : Origin's geohash
`destination` : Destination's geohash
`outbound_date` : Outbound departure date

QUERY PARAMS:

`adult` : Number of adults
`child` : Number of children
`senior` : Number of seniors
`lang` : ISO 3166-1 alpha-2 language code
`currency` : ISO 4217 currency code

The response looks like:
```
{
  "origin_city_id": "375dd5879001acbd84a4683dedf9eed1",
  "destination_city_id": "375dd5879001acbd84a4683ded9c875b",
  "cities": [
    { City },
    { City }
  ],
  "locations": [
    { Location }
    { Location }
  ],
  "operators": [
    { Operator },
    { Operator }
  ],
  "departures": [
    { XDeparture },
    { XDeparture }
  ],
  "complete": false,
  "ttl": 900,
  "is_valid_route": true
}
```

Where a City is like:
```
   {
      "id": "375dd5879001acbd84a4683deda84183",
      "locale": "en",
      "region_id": 6417,
      "name": "New York",
      "lat": 40.71427,
      "lon": -74.00597,
      "geohash": "dr5reg",
      "timezone": "America/New_York",
      "image_url": "/images/promos/city-blocks/new-york.jpg",
      "legacy_url_form": "NewYork,NewYork,UnitedStates",
      "full_name": "New York, New York, United States",
      "region": {
        "id": 6417,
        "locale": "en",
        "country_code2": "US",
        "name": "New York",
        "country": {
          "code2": "US",
          "locale": "en",
          "code3": "USA",
          "name": "United States",
          "continent": "NA",
          "default_locale": "en",
          "default_currency": "USD",
          "population": 310232863
        }
      }
    }
```
Where a Location is like:
```
    {
      "id": 3970,
      "city_id": "375dd5879001acbd84a4683dedfb933e",
      "name": "Métro Bonaventure Bus Station",
      "address": [
        "997 Rue St-Antoine Ouest",
        "Montreal, QC H3C 1A6"
      ],
      "type": "transit_station",
      "lat": 45.4988273060484,
      "lon": -73.5644745826722,
      "geohash": "f25dvfzcz"
    }
```
Where an Operator is like:
```
    {
      "id": "bfc27cd544ca49c18d000f2bc00c58c0",
      "source_id": 155,
      "profile_id": 111,
      "name": "Greyhound",
      "url": null,
      "logo_url": "https://busbud-pubweb-assets-staging.global.ssl.fastly.net/images-service/operator-logos/greyhound.png?hash=1{&height,width}",
      "display_name": "Greyhound",
      "sellable": true,
      "fuzzy_prices": false,
      "sell_tickets_cutoff": {
        "hours": 1
      },
      "amenities": {
        "classes": {
          "Normal": {
            "display_name": "Economy",
            "wifi": true,
            "toilet": true,
            "ac": true,
            "food": false,
            "refreshment": false,
            "power_outlets": true,
            "tv": false,
            "bus_attendant": false,
            "leg_room": false
          },
          "Economy": {
            "display_name": "Economy",
            "wifi": true,
            "toilet": true,
            "ac": true,
            "food": false,
            "refreshment": false,
            "power_outlets": true,
            "tv": false,
            "bus_attendant": false,
            "leg_room": false
          }
        }
      },
      "source": "greyhound_us",
      "referral_deal": false,
      "display_url": null,
      "fraud_check": "iovation",
      "terms": {
        "refund": false,
        "exchange": true,
        "bag_allowed": true,
        "piece_of_id": false,
        "boarding_requirement": "printed_tkt",
        "extra_bag_policy": true,
        "use_new_ticket": false,
        "exchange_cutoff": 24,
        "nb_checked_bags": 1,
        "kg_by_bag": 25,
        "nb_carry_on": 1,
        "extra_bag_cost": 1500
      }
    }
```
And an XDeparture is :
```
    {
      "id": "7c5dd26a",
      "source_id": 155,
      "checkout_type": "new",
      "operator_id": "bfc27cd544ca49c18d000f2bc00c58c0",
      "origin_location_id": 1942,
      "destination_location_id": 1938,
      "class": "Economy",
      "class_name": "Economy",
      "amenities": {
        "display_name": "Economy",
        "wifi": true,
        "toilet": true,
        "ac": true,
        "food": false,
        "refreshment": false,
        "power_outlets": true,
        "tv": false,
        "bus_attendant": false,
        "leg_room": false
      },
      "available_seats": 55,
      "prices": {
        "total": 5200,
        "breakdown": {
          "base": 5200
        },
        "categories": {},
        "discounted": false
      },
      "ticket_types": [
        "print"
      ],
      "departure_timezone": "America/New_York",
      "arrival_timezone": "America/Montreal",
      "departure_time": "2016-01-14T00:01:00",
      "arrival_time": "2016-01-14T07:55:00"
    }
```

### Poll results

**While "complete" is false, you need to call** :

`https://napi.busbud.com/x-departures/:origin/:destination/:outbound_date/poll`

With ***all*** the same parameters that the previous endpoint, plus:

`index` : Index from which to return new departures

The response is:
```
{
  "departures": [
    { XDeparture },
    { XDeparture }
  ],
  "operators": [
    { Operator },
    { Operator }
  ],
  "complete": true,
  "ttl": 900
}
```
