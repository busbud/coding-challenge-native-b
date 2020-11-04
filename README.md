

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

# My solution

![showcase](https://github.com/Rolvar/coding-challenge-native-b/blob/master/screenshots/showcase.gif)

Reading all the specs and restrictions from the challenge doc, I decide to move forward with the app's architecture, although the app is very simple, by experience I know the apps grows and will need additional features like new screens or support another functionalities that weren't have in mind in the first iteration, so that's why I decide to make a project with an structure that can hold future features without modifying too much the existing code.

## SwiftUI

I this section I'll expose why I haven't use SwiftUI. 

Even tho SwiftUI promises to be a powerful UI manager, right now its too much risky to go for it, specially for mid and big projects, I wouldn't recomment to use it for now, because as we know, everything is new comes with some bugs, this is not only for SwiftUI but everything else in sowftware development, so I would rather than using it as first, expect the tool to engage all its power for at least 1 more year, probably when iOS15 comes to live.

Next I would explain a bit more info from my experience building UIs using SwiftUI:
* Declarative aspect of SwiftUI is just comming to us as iOS Devs, and there is no clear guide lines of how views are positioned, like UIKit does with AutoLayout
* There are to many UI components that we have to build on our own, like calendar pickers, MapViews CameraPicker and so on, and that means we have to wrap these ui elements using UIKit, which for me is pointless.
* The main issue with SwiftUI is that there is no backwards compatibility, which means we have to force all our current users to have iOS13 or more, so if company has a project that runs on devices with a lower version, the project will just simply not run.
* The way to build views in SwiftUI makes really hard to adapt some design patters (MVVM, VIPER, MVP, MVC), to achieve this we have to add a bunch of items to handle a bit of UI, like stats, bindings, observers, etc, this gets messy very very quick.
* Navigations and trasitions aren't good either, navigate between 2 screens is a bit messy too, and I'm not talking about going back, in that case the onAppear is not called (this is a huge bug tho).

So, I think just for now is better to not use SwiftUI for mid/big projects, and keep stick to UIKit for a more bit longer, probably the landscape change in the course over the next year and all these issues I've found so far gets fixed and then SwiftUI can be consider the first option to build the UI for our apps.

## App Architecture

I decided to use MVVM, with a clear folder structure of each layer, but with some exceptions:

* **Models**: in this folder I decide to have all the plain objects to hold the info, there is no logic here, just structs with the mapped data needed.
* **Views**: all UI related code is here, sorted by screens, so you'll find 3 folders, onboarding, booking (search) and results
* **ViewModel**: In this folder we can find the single ViewModel used in the results screen, that's because it is a single endpoint to fetch the departures.
* **API**: in this folder I set my API layer, I also set it in a way that can growth adding more endpoints to it and the ApiManager has generics so it can be used to fetch any object that conforms Decodable protocol
* **Utils**: in this folder we are going to find any util class like extensions and helpers to create data or format data according with the views needing
* **Support Files**: Here we have OS related files and assets folder

## Cache Handling

Some missing stuffs here, for example the lag of repository or data manager classes, and that was intended, because given the aspect of the use case of the app, we don't want to have cache data, we always want to have a fresh data each time the user search for departures, so I just don't use the data manager to decide where to fetch the info from, we just go to fetch from the API

## UI Tweaks

Even tho I'm not a designer, I tried to apply as much effort as possible to the UI/UX, because a very good looking app helps to retain users, also its behavior, so just added some UI tweaks in code, for example the `UIImage.blur()` function and so many others so can help to build a good looking app

## Third Party Libraries
Although some companies doesn't like to use third-party libraries inside of the project, there are some libraries that are needed to not *reinvent the wheel*, in this project I just use 4 libraries:
* **Alamofire** to handle the API requests
* **SnapKit** to create UI constraints programmatically and very easy
* **Hero** This library is used for the transitions, but I would rather not to use it, is under develop, but offers a good set of transitions very easy to implement
* **Lottie** This is also to play some image animations

## Issues
There weren't too much issues found:
* API doesn't respond some times, so I had to add a retry button in the fail screen so we can retry the request and we can get the list of departures, although this is something that can be done under APIManager class, to accomplish that I had to add another class to handle the retries for me and for simplicity I just decide to do it manually.
* Images URL have illegal characters, some images_url have illegal characters it like `{ }` that were failing when I tried to pull the image from web, so I decide to search for them and replace them with its hex value `%7B` and `%7D`, after that everything works just fine.
* Dates formatting, in the app I need to handle 4 kinds of dates format, so I created an enum that holds its formats so it can be easy create a date from string with a given format or create an string from date with a given format, all are implemented in the `/utils/extensions/Date.swift` file.
* Parsing issues with the data coming from server, this happens because not all the fields are send, some comes with `null`and make the app crashed, so to solve this, I just decide to put optional values and then use the safe unwrap the ones that I need.

## Extras
As an extra I added support for three languages in the app, `en`, `fr`and `es`, everything should be translated to the device language and if there is no support for it yet, then is going to display the `en` language by default.

Combine over RxSwift, I decide to use combine over RxSwift because is Apple's built in reactive library, and its in a good stage, even tho is pretty new, I think is ready to use in production apps.
