# **Busbud Nearby Cities App**

This project is a coding challenge submission for Busbud. The app fetches and displays a list of nearby cities based on the user's location using the Busbud API. The app follows modern architecture principles with a focus on clean, testable, and maintainable code.

---

## **Pre-requisites**

To run this project, ensure you have the following:

- **Xcode:** Version 16.2 or higher  
- **iOS Deployment Target:** iOS 18.0 or higher  
- **Swift:** Version 5.9  
- **MacOS:** Ventura or higher  
- **Internet Access:** Required for the API calls to work  

---

## **Project Overview**

### **Architecture**

This app follows the **MVVM (Model-View-ViewModel)** architecture pattern and uses the **Repository Pattern** to handle data-fetching logic. Below is a brief description of each layer:

1. **Model:**  
   Represents the data used within the app (`Destination`, `DestinationDetailsViewModel`, etc.).  
   Decodes data from the Busbud API.

2. **ViewModel:**  
   Handles business logic and state management.  
   Interacts with the repository to fetch data.  
   Converts raw data into UI-ready format (e.g., formatted distances).

3. **View:**  
   Displays the UI and binds to `@Observable` properties in the `ViewModel`.  
   Automatically updates when the `ViewModel` state changes.

4. **Repository:**  
   Handles data-fetching logic and makes API calls using `URLSession`.  
   Serves as an abstraction layer between the ViewModel and the API client.

---

## **Use Cases**

### **1. Fetch Nearby Cities Based on User Location**

**Acceptance Criteria:**
- The user sees a loading indicator while cities are being fetched.
- If cities are successfully fetched:
  - The list displays the city name and distance from the user.
  - A button allows the user to view more details for a selected city, including a link to the Busbud page.
  - The list is sorted by the shortest drivable distance first.

**Screenshots:**  
*Add screenshots for the loading, success, and detail views.*

**Error Cases:**
- **Location Permission Denied:**
  - The user is shown an alert prompting them to grant location permissions.
  - There is a button that opens the **Settings** app to the privacy screen.
  
- **API Error:**  
  If the API request fails (e.g., no internet connection), the user sees an error message prompting them to retry.

---

### **2. Empty State (No Cities Nearby)**

**Acceptance Criteria:**
- If no nearby cities are found:
  - The user sees a view with a fun placeholder message and no cities listed.
  
**Screenshots:**  
*Add a screenshot of the empty state view.*

---

### **3. View City Details**

**Acceptance Criteria:**
- The user can select a city to view more details.
- The detailed view displays:
  - City name, region, and country.
  - Distance from the user's current location.
  - A map centered on the city.
  - A button to open the city's Busbud page in Safari.

**Edge Case:**  
If the geohash or URL is invalid, the app safely handles this and prevents a crash.

**Screenshots:**  
*Add screenshots showing the detailed city view and Safari opening the link.*

---

## **Localization**

The app is localized in:
- **English (en)**
- **Portuguese (pt)**

All labels and messages adapt to the device's language settings.

---

## **Dark Mode Compatibility**

The app supports **Dark Mode** and automatically adapts its UI for both light and dark appearances.

**Screenshots:**  
*Add light mode and dark mode screenshots to demonstrate compatibility.*

---

## **Testing**

The project includes extensive unit tests using the new **Swift Testing** framework.

### **Test Coverage:**

- **ViewModel Tests:**  
  Tested state transitions for success, empty, and error cases.  
  Verified that the distance is formatted correctly.

- **Repository Tests:**  
  Mocked API responses to simulate network success and failure.

- **Geocoding Tests:**  
  Verified the reverse geocoding logic for converting coordinates to city names.

- **Details View Model Tests:**  
  Verified that the correct URL is opened when the "View on Busbud" button is pressed.

**Run Tests:**
```bash
Cmd + U  # Run tests in Xcode
```

---

## **Implementation Details**

### **1. API Client**

The `APIClient` class handles all network requests:
- Uses `async/await` for better readability and concurrency.
- Handles URL construction, HTTP headers, and error handling.
- Automatically formats distances using `MeasurementFormatter`.

### **2. Location Manager**

The `LocationManager` class:
- Requests location permissions.
- Fetches the user's current location using `CoreLocation`.
- Handles permission changes and errors gracefully.

---

## **Error Handling and Edge Cases**

- The app gracefully handles network errors, showing an error view with retry options.
- If location permissions are not granted, the app shows an appropriate message.
- The app shows a placeholder when no nearby cities are found.

---

## **How to Run the App**

1. Clone the repository:
   ```bash
   git clone <your-forked-repo-url>
   cd BusbudCodeChallenge
   open BusbudCodeChallenge.xcodeproj
   ```
2. Select a simulator or device in Xcode.
3. Press **Cmd + R** to run the app.

---

## **Screenshots**

*Upload screenshots of the main screens: loading view, empty state, list view, detailed view in both light and dark modes.*

---

## **Pull Request Description**

- The app follows the **MVVM + Repository** architecture for clear separation of concerns.
- Implemented detailed state management with loading, empty, and error states.
- The app is fully localized in **English** and **Portuguese**.
- Extensive unit tests are included to ensure reliability.
- The UI is compatible with **Dark Mode**.
- Screenshots of all views are provided to illustrate the user experience.

---
