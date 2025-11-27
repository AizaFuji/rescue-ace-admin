# Rescue Ace Admin

A Flutter mobile application for Rescue Ace emergency management system administrators.

## Features

- Admin authentication and profile management
- Interactive map view of emergency equipment locations
- Add and manage emergency equipment
- Real-time location tracking with GPS coordinates

## Tech Stack

- Flutter
- Provider (State Management)
- Flutter Map & Mapbox
- HTTP client
- Shared Preferences

## Getting Started

### Prerequisites

- Flutter SDK (3.5.4+)
- Dart SDK

### Installation

1. Clone the repository
2. Run `flutter pub get`
3. Create `.env` file with required environment variables
4. Run `flutter run`

### Environment Variables

Create a `.env` file in the root directory:

```
API_BASE_URL=http://rescue-ace.ddns.net
MAPBOX_ACCESS_TOKEN=your_mapbox_token_here
```

## Architecture

This project follows Clean Architecture principles with three main layers:
- Presentation (UI & State Management)
- Domain (Business Logic & Entities)
- Data (Repositories & Data Sources)

## Building

```bash
flutter build apk --release
flutter build ios --release
```

## License

Proprietary software. All rights reserved.
