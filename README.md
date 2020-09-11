
![onboarding](/screenshots/Onboarding.png?raw=true "Onboarding")
![search](/screenshots/Search.png?raw=true "Search")
![departures](/screenshots/Departures.png?raw=true "Departures")


# Breef description of challenge development

- Review requirements, define 3 main user stories
  - As a user I want to see an onbording and be able to enter the app after complete the onboarding
  - As a user I want to be able to choose the departure time, the number of tickets for adults, children and senios, the language and the currency to search departures
  - As a user I want to see the departures with departure time, arrival time, location address and  price
- Create the base project with gitignores, lint and basic structure
- Add a generic onboarding
- Analize the API requirements and field types
- Find data sets for language ISO 3166-1 alpha-2 and currency : ISO 4217, used vijinho ISO-Country-Data repository
- Add search view and fields range validations
- Request departures to the API
- Track and fix a param error, used postman to confirm the params
- Add departures view
- Add Assets and documentation

# Main challenges and workarounds
- SwiftUI bridges to UIKit
  - Implemented UIViewRepresentable and UIHostingController wrappers
- Datasets of language ISO 3166-1 alpha-2 and currency : ISO 4217
  - Implemented a swift dataset version of vijinho ISO-Country-Data repository
- Combine not so easy to debug
  - Implemented an old session dataTask for debugging
- Busbud API empty departures response
  - Implemented Stub data
