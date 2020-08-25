

![osheaga](https://cloud.githubusercontent.com/assets/1574577/12971188/13471bd0-d066-11e5-8729-f0ca5375752e.png)

Hello! 

Before starting anything the parameters used on the search are hardcoded in `SearchPresenter.swift`: 
```
let origin = "dr5reg"
let destination = "f25dvk"
let date = "2021-07-29"
```
So you can change it accordingly to find better results.

### Solution

The presented architecture is a bit more than what's needed for the actual problem, but it is inspired in MVP & VIPER to show how it is possible to have a clean architecture with the responsibilities well defined.

So mainly we have 2 layers before reaching the data (Networking/Database): `View` and `Interactor`:
`View`: Should be composed of ViewControllers, Custom Views, Cells, and the Presenters. Presenters should be the connection between Views and the lower layers attempting to leverage the work of its View. Presenters should get the user's input from the top View and prepare it to be handled by the business layer.
`Interactor`:  Is the structure that handles the business logic and decides where to pull the data needed by the View layer (Database/Networking, etc.). The Presenter is not necessarily responsible for completely handling any data mapping for the Interactor, sometimes the data doesn't need any change but in the case that it needs, the Interactor should be responsible for preparing the data to request from the Repositories (DB/API) 

In this case the Interactor is connected to a `Service` (or a set of services, if needed) that connects with an API. Furthermore the `Model` should be as dumb as possible (ideally immutable to grant thread safety, not the case in this example).

In a more generic way the solution was made like this: 

There is an IntroScreen just to start up, after the user clicks on the main button the search screen appears and starts loading the hardcoded search.
The `SearchViewController` is connected to the `SearchPresenter` through a few closures that will inform the View of updates, or errors that it should react to. `SearchPresenter` will handle the init search and polling the results from the `SearchInteractor` that connects with the BusbudAPI.

If the Presenter and the Interactor were joined in one entity, it'd be a `ViewModel` on a MVVM architecture. I like to keep those 2 separated in case of weird backends or complex interactions with the repositories, business logic on when to fetch from local repo or cloud repo, etc.

The issues I've found were basically related to making the search work and polling with promiseKit, but I've worked around it trying a few different parameters and tweaks.

### Extras

There are a few errors handles, I've assumed that the `ttl` from the polling is a timeout to stop polling regardless of  `"complete":true`, some other errors are just being popped as alerts. The solution also has some localized strings, and is ready for light and dark modes.
