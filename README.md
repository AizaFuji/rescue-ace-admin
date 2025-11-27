# Rescue Ace Admin

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## Project Overview

Rescue Ace Admin is a robust Flutter-based mobile application designed for administrators of the Rescue Ace emergency management system. It empowers users to efficiently manage emergency equipment, track locations in real-time, and ensure seamless operations during critical situations.

## Features

- **Secure Authentication**: User login and profile management for authorized access.
- **Interactive Mapping**: Visualize emergency equipment locations on an integrated map.
- **Equipment Management**: Add, edit, and monitor emergency tools and resources.

## Tech Stack

- **Flutter**: Cross-platform mobile development framework.
- **Provider**: State management solution for reactive UI updates.
- **Flutter Map & Mapbox**: Interactive mapping and location services.
- **HTTP Client**: API communication for data retrieval and updates.
- **Shared Preferences**: Local data storage for user preferences.


## Getting Started

### Prerequisites

- Flutter SDK (version 3.5.4 or higher)
- Dart SDK

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd rescue-ace-admin
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up environment variables by creating a `.env` file with required configurations.

4. Run the application:
   ```bash
   flutter run
   ```

## Building

To build for production:

- For Android APK:
  ```bash
  flutter build apk --release
  ```

- For iOS:
  ```bash
  flutter build ios --release
  ```
