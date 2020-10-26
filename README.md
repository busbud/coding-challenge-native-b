
## Challenge Notes

### Architecture
- Although I feel more comfortable with MVP, decided to use MVVM with the architecture components provided by the Android platform to trial out some of its latest features.
- Did not implement UseCase/Interactor and directly injected the repository on the ViewModel. If I invested more time and/or added more features, the logic for the caching of the response and the "complete" logic to continue to poll results would probably be wrapped in a UseCase/Interactor. In the end I felt that the ViewModel got a bit more bloated than I would like to.
- Decided not to use Fragments, as they were not needed for the sake of the challenge. If we were to support tablet with list->detail, I would probably encapsulate the SearchActivity within a Fragment.

### Dependency Injection
- Decided to try a alpha library, which is [Hilt](https://developer.android.com/training/dependency-injection/hilt-android), and got pretty happy with the choice. Seems to release the developer from some of the work needed for the initial Dagger configuration for a new project.
- Unfortunately, due to time restrictions ended up not taking advantage of one of the nicest features for me, which is the easier way of uninstalling and installing a module on the dependency graph for the UI/Integration tests.

### Functionality
- Initial screen is a simple screen with a small information text.
- Once you click on Find Bus button you will be moved to the Search page with the predefined data from the Challenge
- Since the API was returning 0 results for 29th July 2021, I have added the capability for the user to switch the dates (by pressing on the TextView, not a beautiful UI experience I know, but the addition of dynamic choosing the dates was a late call)
- Also provided the ability to change Currency. For that included an existing library (not done by me). If I was building this for my product, I would probably create a specific currency selector, with currencies supported by the API.
- Error handling is kind of limited. Only sends an error, but does not do any specific parsing. So every error will lead to the same error message.

### Network
- For network I've used [Retrofit](https://square.github.io/retrofit/)
- For json serialization I've decided to try out as part of this challenge [Moshi](https://github.com/square/moshi)
- Only parsed fields that I felt could be relevant for the challenge.

### Asynchronous Tasks
- Although Google team recently announced that Coroutines are the new recommended way of doing asynchronous work, I've decided to go with [RxJava](https://github.com/ReactiveX/RxJava), as I feel more comfortable with it at this point.

### UI Tests
- Did only a small example, so you understand how I think about UI tests. Usually I like to use the Robot Pattern for them. With more time I would have covered the SearchActivity also with UI tests.

### Other Notes
- Did not worried too much with Timezones. With more time would do a bit more extensive work around TimeZones to improve the implementation (as they are always tricky..)
- UI is not amazing, as I decided not to waste too much time on it, for the sake of the challenge. If aiming to deliver to production, I would rethink some of the UI choices.
- Color structuring are ready to Dark Mode, but I did not validate that the colors would work good in the Dark Mode.
- Text Appearance should be stylized (so we would have a set of predefined styles), but for this purpose they are defined ad-hoc per screen.
- For the sake of the challenge, did not considered the language of the device. I am always calling the API without the "lang" query parameter, but could easily adapt to use device language to define that query parameter.

## Original Challenge Info

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

Hey! 

It will be hot this summer in Montreal with the [Osheaga festival](http://www.osheaga.com/)! 
Assuming we're not stuck with another wave of COVID-19, it will also be a rocking festival!
Your challenge is to build a promotional app that allows a traveler from Quebec City to find one-way departure schedules for the festival's opening weekend.

### Requirements

Write a native Busbud app that:

- Has a simple onboarding screen that will open the search
- Lists all the departures for a given origin city (**Quebec - geohash: f2m673**) and a given destination city (**Montreal - geohash: f25dvk**) for a given day (**the 29th of July 2021**) for **1** adult. 
For each item, we want, at least, to see the **departure time**, the **arrival time**, the **location name** and the **price** (use `prices.total` of the `departure`).

### Non-functional requirements

- Challenge is submitted as pull request against this repo ([fork it](https://help.github.com/articles/fork-a-repo/) and [create a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)).
- The repo should include 3 screenshots under the /screenshots folder to show the app usage.
- Change the README.md to explain your solution, the issues, the way you solved them...

### Supporting API

In order to complete this challenge, you will be making requests to `napi.busbud.com`, Busbud's production API.  
For all requests, you MUST provide the following HTTP headers:

Header | Value
--- | ---
Accept | `application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/`
X-Busbud-Token | The token provided in the challenge invitation email.

### Init results

To get departure results, search is initialized via the following endpoint:

`https://napi.busbud.com/x-departures/:origin/:destination/:outbound_date`

PATH PARAMS  

- `origin` : Origin's geohash
- `destination` : Destination's geohash
- `outbound_date` : Outbound departure date, ISO 8061 date

QUERY PARAMS:

- `adult` : Number of adults
- `child` : Number of children
- `senior` : Number of seniors
- `lang` : ISO 3166-1 alpha-2 language code
- `currency` : ISO 4217 currency code

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
