# Flutter To-Do App

A simple and clean To-Do application built with Flutter and GetX.
The app demonstrates basic Flutter UI development, reactive state management, and CRUD-style task operations.

## Features

* Add new tasks
* Mark tasks as completed/uncompleted
* Delete tasks
* Empty state when there are no tasks
* Responsive and clean UI
* GetX-based state management

## Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** GetX
* **UI:** Material 3

## Flutter Version

```text
Flutter 3.29.3
Dart 3.x
```

> The application was developed and tested using Flutter 3.29.3.

## Packages Used

The project intentionally uses minimal dependencies.

### GetX

```yaml
get: ^4.6.6
```

GetX is used for reactive state management and dependency injection.

No backend, database, Firebase, or API integration is required for this project.

## Project Structure

```text
lib/
│
├── main.dart
│
├── models/
│   └── task_model.dart
│
├── controllers/
│   └── task_controller.dart
│
├── views/
│   └── todo_screen.dart
│
└── widgets/
    ├── task_item.dart
    └── empty_state.dart
```

## Setup Instructions

## 1. Clone the repository

```bash
git clone <repository-url>
```

## 2. Navigate to the project

```bash
cd <project-folder>
```

## 3. Install dependencies

```bash
flutter pub get
```

## 4. Check Flutter setup

```bash
flutter doctor
```

## 5. Run the application

```bash
flutter run
```

For Flutter Web:

```bash
flutter run -d chrome
```

-- Flutter Questions

# 1. What is the difference between StatelessWidget and StatefulWidget?

A `StatelessWidget` is immutable and its UI does not change after it is built. A `StatefulWidget` can maintain mutable state and rebuild its UI when the state changes.

# 2. What is setState() used for in Flutter?

`setState()` is used in a `StatefulWidget` to notify Flutter that the widget's state has changed. Flutter then rebuilds the affected widget to display the updated state.

# 3. What is the difference between ListView and Column?

`Column` arranges widgets vertically and does not scroll by default. `ListView` is designed for displaying lists and provides scrolling, making it more suitable for dynamic or large collections of items.

# 4. How would you handle an API call in Flutter?

I would use packages such as `http` or `Dio` to make API requests and use `Future`, `async`, and `await` to handle asynchronous operations. I would also handle loading, success, and error states appropriately.

# 5. What is the purpose of pubspec.yaml?

`pubspec.yaml` contains the project's metadata and configuration, including dependencies, assets, fonts, and SDK constraints. It is also used to manage external packages required by the application.

# 6. Which Flutter project or feature have you worked on that you are most proud of, and what was your contribution?

I am most proud of my **Alarmy app**, a personal Flutter project designed as a task-based alarm application. I implemented alarm scheduling, local notifications, persistent storage using Hive, audio playback, and the logic that requires users to complete a task before dismissing the alarm.

# GetX Implementation

GetX is used to manage the application's task state.

The task list is maintained using a reactive `RxList`:

```dart
final RxList<Task> tasks = <Task>[].obs;
```

`Obx()` is used to automatically rebuild the UI whenever the task list changes.

The controller handles:

* Adding tasks
* Completing/uncompleting tasks
* Deleting tasks

This keeps the task-related logic separate from the UI.

# Notes

This project intentionally keeps the architecture simple because the objective is to demonstrate fundamental Flutter concepts, clean UI development, state management, and code organization without unnecessary complexity.


## Source Code

The complete Flutter source code is available on GitHub:

**GitHub Repository:**
`https://github.com/shivs3114/flutter_todo`

The repository contains the complete Flutter project, including the `lib` source code, project configuration, dependencies, README, and platform-specific project files.

## APK for Testing

A release APK is provided for easy testing of the application.

**Download APK:**
`https://drive.google.com/file/d/1yTKwRj2c0L9fOAHfyZc4fq5o-XYIgTRE/view?usp=drive_link`

### Installation

1. Download the APK on an Android device.
2. Open the downloaded APK.
3. Allow installation from unknown sources if prompted.
4. Install and launch the application.

### APK Details

* **Application:** Flutter To-Do App
* **Build Type:** Release
* **Framework:** Flutter
* **State Management:** GetX
* **Platform:** Android
* **Purpose:** Practical assessment and testing


