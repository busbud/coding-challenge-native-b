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
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 19 36](https://github.com/user-attachments/assets/0a4c436b-b942-4335-83be-68bf3b0f89f9)
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 19 40](https://github.com/user-attachments/assets/66df63df-e950-448c-930a-9e6ef29f37af)
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 20 16](https://github.com/user-attachments/assets/9a84a7f6-3d37-4f93-b6b9-05726b8d4e47)


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
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 20 55](https://github.com/user-attachments/assets/58ddf2e3-fef9-43c9-8ab4-ad3c628001cc)


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
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 20 16](https://github.com/user-attachments/assets/9a84a7f6-3d37-4f93-b6b9-05726b8d4e47)
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 20 29](https://github.com/user-attachments/assets/61ec3ddb-1d77-4b66-b779-7e4b2be926e9)

---

## **Localization**

The app is localized in:
- **English (en)**
- **Portuguese (pt)**

All labels and messages adapt to the device's language settings.
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 11 26](https://github.com/user-attachments/assets/a4416105-1d7b-44ca-a0f9-97637cbad1d1)
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 19 36](https://github.com/user-attachments/assets/686901cc-5503-4f0e-b21b-a1fd83aaa76a)
<img width="1462" alt="Screenshot 2025-01-09 at 7 19 34 PM" src="https://github.com/user-attachments/assets/877fb046-e41a-4325-88bc-a66115838c2d" />


---

## **Dark Mode Compatibility**

The app supports **Dark Mode** and automatically adapts its UI for both light and dark appearances.

**Screenshots:**  
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 19 12 01](https://github.com/user-attachments/assets/b31a3846-09a6-4c6d-b36a-e0c37f49cc0e)
![Simulator Screenshot - iPhone 16 Pro - 2025-01-09 at 15 20 16](https://github.com/user-attachments/assets/d13af74c-99dd-454f-8c4b-3bb745be70a2)

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
