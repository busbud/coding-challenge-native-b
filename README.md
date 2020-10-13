

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

Hey! 

### How to use

- Install carthage.
- run: carthage update --platform iOS --no-use-binaries --cache-builds
- enjory

### Solution

The architect that has been used in challenge app is : MVVM. Using RXSwift + Dependency injection.
The origin and destination are hardcoded in SearchViewModel
private let path = SearchPathParams(origin: "f2m673", destination: "f25dvk", date: "2021-01-02")
which will be very easy to link to UI in case we wanted to.
The reason of using dependency injection is that making codes more testable.

### Challenge

The challenge that I had was lack of documentions. it wasn't clear which part of respons will be optional or manadatory or under which circumstances we shouldn't call poll or how to use index ?
What I have done was trying and observing results. Although I am still not sure if I have done it in a right way.

### Improvments

- There so many details that can be improved.
- Timing for poll : like when user reach last cell of tableview
- Error Handling: like when no internet connection, no result found, broken json and ....
- Localization
- Fonts
- Unit-Tests 
