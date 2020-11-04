

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

# My solution

![showcase](https://github.com/Rolvar/coding-challenge-native-b/blob/master/screenshots/showcase.gif)

Reading all the specs and restrictions from the challenge doc, I decided to move forward with the app's architecture, although the app is very simple, by experience I know that apps grow and will need additional features like new screens or additional functionality that weren't in mind in the first iteration. That's why I decided to make the project with a structure that can hold future features without modifying the existing code too much.

## SwiftUI

In this section I'll expose why I haven't used SwiftUI. 

Even tho SwiftUI promises to be a powerful UI framework, right now it feels too risky to use it in production, specially for mid to large sized projects. I wouldn't recomment to use it for now, because as we know, everything new comes with some bugs, which is not only true for SwiftUI but everything else in software development. So I would rather use UIKit for now as I expect that it won't become full-featured and stable for at least 1 more year, probably when iOS 15 is released.

Next I would explain a bit more info from my experience building UIs using SwiftUI:
* The declarative aspect of SwiftUI is just coming to us as iOS developers, and there is no clear guidelines of how views are positioned, like UIKit does with AutoLayout.
* There are to many UI components that we have to build on our own, like calendar pickers, MapViews, CameraPicker, and so on, so that means we have to wrap these UI elements using UIKit, which for me doesn't make sense. If many common useful elements needs to be wrapped from UIKit anyway to work in SwitftUI, it makes more sense to just directly use UIKit for the time being.
* The main issue with SwiftUI is that there is no backwards compatibility, which means we have to force all our current users to have iOS13 or higher, so if the company has a project that runs on devices with a lower version, the project will just simply not run. SwiftUI is also fairly buggy on iOS 13, so realisticly iOS 14 is the minimum for a SwiftUI production app.
* The way to build views in SwiftUI makes it really hard to adapt some design patters (MVVM, VIPER, MVP, MVC), to achieve this we have to add a bunch of items to handle a bit of UI, like stats, bindings, observers, etc. This gets messy very very quick.
* Navigations and trasitions aren't good either. Navigating between 2 screens is a bit messy too, and I'm not talking about going back, in that case the onAppear is not called (this is a huge bug and is just one example of why I feel SwiftUI isn't stable enough for production use).

So, I think for now it is better to not use SwiftUI for mid/large sized projects, and to keep sticking with UIKit for a little bit longer. Probably the landscape will change over the course over the next few years, and all these issues I've found so far will be fixed. At that point, I think SwiftUI can be considered the first option to build the UI for our apps.

## App Architecture

I decided to use MVVM, with a clear folder structure of each layer, but with some exceptions:

* **Models**: In this folder I decided to have all the plain objects to hold the info, there is no logic here, just structs with the mapped data needed.
* **Views**: All UI related code is here, sorted by screens, so you'll find 3 folders, onboarding, booking (search) and results.
* **ViewModel**: In this folder we can find the single ViewModel used in the results screen, that's because it is a single endpoint to fetch the departures.
* **API**: In this folder I put my API layer, I also set it in a way that it can grow by adding more endpoints to it and the ApiManager has generics so it can be used to fetch any object that conforms to the Decodable protocol.
* **Utils**: In this folder you will find any utility class like extensions and helpers to create data or format data as needed in the views.
* **Support Files**: Here we have OS related files and assets folder.

## Cache Handling

Some missing stuff here, for example the lag of the repository or data manager classes. That was intentional, because given the use case of this app, we don't want to have cached data, we always want to have a fresh data each time the user search for departures. So I don't use the data manager to decide where to fetch the info from, we just go to fetch from the API.

## UI Tweaks

Even tho I'm not a designer, I tried to apply as much effort as possible to the UI/UX, because a very good looking app helps to retain users, also its behavior. So I added some UI tweaks in the code, for example the `UIImage.blur()` function and so many others so can help to build a good looking app.

## Third Party Libraries
Although some companies doesn't like to use third-party libraries inside of their projects, there are some libraries that are needed to not *reinvent the wheel*. In this project I just use 4 libraries:
* **Alamofire** to handle the API requests
* **SnapKit** to create UI constraints programmatically and very easy
* **Hero** This library is used for the transitions, but I would rather not to use it, is under development, but offers a good set of transitions that are very easy to implement.
* **Lottie** This is also to play some image animations

## Issues
There weren't too many issues found:
* API doesn't respond some times, so I had to add a retry button in the fail screen so we can retry the request and get the list of departures. Although this is something that can be done in the APIManager class, to accomplish that I had to add another class to handle the retries for me and for simplicity I just decide to do it manually.
* Images URL can have illegal characters. Sometimes the images_url has illegal characters like `{ }` that were failing when I tried to pull the image from web, so I decide to search for them and replace them with their hex values `%7B` and `%7D`, after that everything works just fine.
* Date formatting. In the app I needed to handle 4 kinds of dates formats, so I created an enum that holds its formats so it's easty to create a date from string with a given format or create an string from date with a given format, all are implemented in the `/utils/extensions/Date.swift` file.
* Parsing issues with the data coming from server. This happens because not all the fields are sent, some come with `null` and make the app crash, so to solve this, I just decided to put optional values and then use safe unwrapping on the ones that I need.

## Extras
As an extra I added support for three languages in the app, `en`, `fr`and `es`. Everything should be translated to the device language and if there is no support for the device's language yet, then it will display the `en` language by default.

Combine over RxSwift. I decide to use Combine over RxSwift because it's Apple's built in reactive library, and its in a good stage. Even though is pretty new, I think is ready to use in production apps.
