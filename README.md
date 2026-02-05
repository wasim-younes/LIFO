Life Organizer (LiFo)
A professional, offline-first calendar and schedule management application built with Flutter. Unlike standard calendar apps, LiFo is designed for deep categorization of life activities, from specialized workouts to detailed shopping lists, all while maintaining strict data privacy through local-only storage.

🚀 Key Features
100% Offline-First Architecture: Built using the Drift database for high-performance local storage. All data stays on your device, ensuring total privacy and availability without an internet connection.

Google Calendar-Inspired UI: A familiar, full-screen responsive calendar that adapts to both portrait and landscape orientations.

Specialized Schedule Types:

Shopping: Create detailed lists with items, quantities, and store locations.

Workout: Track exercise types, intensity, duration, and specific equipment used.

Meetings: Manage virtual or physical meetings with attendee lists and agendas.

Meals: Schedule meal types, cuisines, and cost estimations.

Lectures & Entertainment: Track academic subjects or social events like concerts and movies.

Unscheduled Events: Support for "floating" tasks that belong to a specific month or year but haven't been assigned a specific day or time yet.

Modern State Management: Uses Riverpod for a reactive, maintainable, and testable codebase.

🛠️ Technical Stack
Frontend: Flutter (Latest SDK)

State Management: Riverpod

Local Database: Drift (formerly Moor)

Architecture: SOLID principles with a repository pattern to ensure the code is maintainable and extendable.

🏗️ Project Structure
Plaintext
lib/
├── data/
│   ├── database/     # Drift database configuration and tables
│   ├── models/       # Data models for schedules and calendar logic
│   ├── notifiers/    # StateNotifiers for business logic
│   └── repositories/ # Data access layer
├── presentation/
│   ├── providers/    # Riverpod providers for UI data
│   ├── screens/      # Main application screens (Calendar, Add Event, etc.)
│   ├── themes/       # Global styling and Material 3 configuration
│   └── widgets/      # Reusable UI components (DayTimeline, CalendarCells)
└── utils/            # Helper classes and database utilities
🚥 Getting Started
Prerequisites
Flutter SDK (3.x or higher)

Dart SDK

Installation
Clone the repository:

Bash
git clone https://github.com/wasim-younes/LIFO.git
Navigate to the project folder:

Bash
cd lifo
Install dependencies:

Bash
flutter pub get
Generate the database code (Drift):

Bash
flutter pub run build_runner build --delete-conflicting-outputs
Run the application:

Bash
flutter run
📝 Future Roadmap
Cloud Sync: Optional asynchronous syncing to a personal server or PC.

Media Support: Ability to attach images to shopping items and grocery lists.

Advanced Statistics: Visual summaries of monthly activities and workout trends.

📄 License
This project is developed as a professional-grade personal organizer. Details regarding licensing can be found in the project documentation.