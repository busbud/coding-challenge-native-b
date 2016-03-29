

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

Hey! 

It will be hot this summer in Montreal with the [Osheaga festival](http://www.osheaga.com/)! 
Your challenge is to build a promotional app that allows a traveler from NYC to find one-way departure schedules for the festival's opening weekend.

### Requirements

Write a native Busbud app that:

- Has a simple onboarding screen that will open the search
	- *For this requirement I have decided to bring the context of the application when downloading the list of bus.* 
	![](https://40.media.tumblr.com/e75dfa744d646a0a0162a2afbcacd3b1/tumblr_o4rpw2B1Kk1tsy5wyo1_540.png)
- Lists all the departures for a given origin city (**New York - geohash: dr5reg**) and a given destination city (**Montréal - geohash: f25dvk**) for a given day (**the 29th of July 2016**) for **1** adult. 
For each item, we want, at least, to see the **departure time**, the **arrival time**, the **location name** and the **price** (use `prices.total` of the `departure`).
	- *For this requirement I used a simple AppCompatActivity, with coordinator layout that use RecyclerView to show informations. I use also a CardView as a container to present departure informations. I didn't use fragment because it's was not necessary in that case but habitually I put my logic in a Fragment class and use an Activity class as a container, because I reuse the fragment for a tablet format. The currency and the language that are use for the api call are the default of the devic. In an other version, it should be better to let user choose in which language or currency they want see in results.*
![](https://36.media.tumblr.com/dc34c1766d16aeca0a0f7029f529ba0c/tumblr_o4s39t5jxa1tsy5wyo1_540.png)
	- *I used Robospice Library to call web service, it's a spring android library that allow to add cache between call.* [Robospice documentation](https://github.com/stephanenicolas/robospice). 
		- *Calls are made in the class DepartureAPI and use the services classes DataRequestJson to build the request( the Accept Header "application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"  is in this class) , MyDownloadManager to execute the call and MySpringAndroidService to create the RestTemplate with the good mapping ( I can specify other mappings than Json in this class).* 
	- *I also use Jackson annotation to do the mapping between Json object and Java object. With Jackson if a name in Json change it's super easy to modify the annotation without affecting the rest of the code.*
	-  *I have a DataManager class that is an singleton that conserve base information for the application, like the URL API, the SpiceManager instance ( it's use for the web services calls), the lang and currency of the user.*
	-  *I created a reusable class MessageView to show an error message if there is a network error. This class, is reusable in any other projet or activity and let user retry the call when they have internet connection.*
	![](https://40.media.tumblr.com/6508d40e21ffa5bf23871833d3397219/tumblr_o4s4jxlphy1tsy5wyo1_540.png)
	
	- *For fun I added an option that allows the user to look for a bus according to the time that he desires arrived at the festival.*
	-  *My application is separated in thoses packages*:
		-  *api : All api call for the projet*
		-  *model : All the model classes ( like XDeparture and Operator classes)*
		-  *service*
		-  *ui*
		-  *utils : All the classes and functions that will be reuse or can be in other projets, like the function to have the good money formatting with the currency is in this class*
		
---
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
