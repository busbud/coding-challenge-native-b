# Busbud coding challenge
An app that lists bus travel schedules for a given route and a given date


## App show case
<p align="center">
  <img src="https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/busbudShowCase.gif" />
</p>


## Screen shots

Splash | Welcome | Info
--- | ---  | ---
![splash](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/splashScreen.png) | ![Welcome](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/welcom.png) | ![info](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/info.png)

 Search | Search Result
--- | ---
![search](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/search.png) | ![searchResult](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/searchResult.png)

If arrive in the next day |
--- |
<img src="https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/cellMagnifier.png" width="300" />


## UI Characters:
I used one of the UI designes from `Ayik Four` and change the color of his characters to match Busbud brand.

`https://dribbble.com/ayikfour`


## Challenges:
As described in the requirements, we need to pass search parameters to the endpoint:

`https://napi.busbud.com/x-departures/:origin/:destination/:outbound_date`

and then for loading more, we have to send the same search parameters plus `index` and add `poll` at the end of base search path for loading more data.
so the search requires Model will be like this:
```
struct SearchModel {
    var departureGeoHash:String = ""
    var departureName:String = ""
    var arrivalGeoHash:String = ""
    var arrivalName:String = ""
    var adult:String = "1"
    var date:String = ""
    var child:String = ""
    var senior:String = ""
    var lang:String = ""
    var currency:String = ""
}
```
The developer can use this Model to pass the search request object from the boarding screen and also be manipulated from the Filter screen and ask for loading data again.

For loading data from the server, app is using `Alamofire 5`  with `Result` mode. All the networking logics happening in the Network folder.

Class | Responsibility 
--- | ---
APIClient | Requesting data from server with the help of Alamofire.
APIRouter | Create routes by specifying the path, method, parameters and setting HTTP headers.
APIParameterKey | Provide parameters for using in APIRouter.
NetworkConstants | All the constants that needs for requesting data from server.
 
**Loading data:**

by calling the initial search endpoint server returns:
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
but when loading more data, we just have:
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

So we have to do some mapping and extracting data from the objects for presenting data in the table. We won't need all the data that the server sent to us for populating our table view. Also, some of them are just raw data. So we need to change to understandable objects for users.

In those case, we need a Model Manager that can handle all these and prepare a clean Array of DeparturesCellViewModel for our table view.

When we already have the initial search on the next loading data, the Model Manager just adds data to the departures and operators list. This achieved by:

`public func addRouteData`

some of the helper functions in this manager are:

Helper functions |
--- |
getDate
isNextDay
getTime
extractLocationName
extractCompanyName
getDuration
toCurrencyFormat


For simplicity, app uses a TitleView class to add it as a view for the navigation bar. It shows the  "From - > To"  with the date that the user searched. also, it has a model view for presenting data

**cell:**

shows various essential data:
Date, Price, departure time, arrival time, duration, where to go on the bus, and where the bus will stop. Company name, up to 4 amenities, the total available seats.

![cell](https://github.com/sajjadsarkoobi/coding-challenge-native-b/blob/main/Screenshots/cells.png)

# Loading More data Challeng:
Sometimes, the initial search has a response, but it doesn't provide departures, and the `complete` still is false. So with these assumptions, we are loading data again for the poll endpoint.
```
if self.canLoadMore && self.dataSource.count == 0 && data.departures.count == 0 {
    print("Load data again")
    self.loadData()
}
```


## To be improved
- [ ] Test cases
- [ ] Adding no data lable or view when nothing to present.
- [ ] Needs to know better server behaiviours for creating robust data presentation.
- [ ] Model Manager.
- [ ] Models.
- [ ] Cell UIView.

