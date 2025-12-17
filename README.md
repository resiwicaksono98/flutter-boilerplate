# 🚀 Flutter Production Boilerplate

A robust, scalable, and production-ready Flutter boilerplate designed with **Feature-First Clean Architecture**.

This project serves as a solid foundation for building large-scale Flutter applications, enforcing best practices, separation of concerns, and maintainability.

## ✨ Key Features

*   **🏗 Architecture**: Feature-First Clean Architecture (Presentation, Domain, Data).
*   **🍷 State Management**: [Riverpod](https://riverpod.dev/) (AsyncNotifier, Code Generation).
*   **🧭 Navigation**: [GoRouter](https://pub.dev/packages/go_router) for declarative routing.
*   **🌐 Networking**: [Dio](https://pub.dev/packages/dio) with robust Interceptors (Auth, Logging, Refresh Token flow).
*   **💾 Local Storage**: Secure storage wrapper using `SharedPreferences`.
*   **🎨 UI/UX**: Material 3 Design, Theme Extensions, and responsive widgets.
*   **🧱 Code Generation**: [Freezed](https://pub.dev/packages/freezed) & [Riverpod Generator](https://pub.dev/packages/riverpod_generator) to reduce boilerplate.
*   **🧪 Testing**: Unit & Widget tests setup with [Mocktail](https://pub.dev/packages/mocktail).
*   **📝 Logging**: Pretty logging with `logger`.
*   **🌍 Localization**: Setup for `intl` and `flutter_localizations`.

## 📂 Folder Structure

The project follows a **Feature-First** approach, where each feature is a self-contained module.

```text
lib/
├── app/                 # Global App Configuration
│   ├── app.dart         # Root Widget
│   ├── router.dart      # GoRouter Setup
│   ├── theme.dart       # App Theme & Extensions
│   └── di.dart          # Dependency Injection
├── core/                # Core functionality shared across features
│   ├── constants/       # Global Constants
│   ├── error/           # Failures & Exceptions
│   ├── network/         # Dio Client & Interceptors
│   ├── storage/         # Local Storage Service
│   ├── utils/           # Logger, Formatters, etc.
│   └── widgets/         # Shared Widgets (AsyncValueWidget, etc.)
├── features/            # Feature Modules
│   └── product/
│       ├── data/        # Data Layer (Repositories impl, Data Sources, Models)
│       ├── domain/      # Domain Layer (Entities, Repositories interface, Usecases)
│       └── presentation/# Presentation Layer (Providers, Pages, Widgets)
└── main.dart            # Application Entry Point
```

## 🛠️ Tech Stack & Libraries

-   **Flutter Riverpod**: Dependency injection and state management.
-   **Dio**: Http client for Dart.
-   **GoRouter**: A declarative routing package.
-   **Freezed**: Code generation for immutable classes and unions.
-   **Json Serializable**: Automated JSON serialization.
-   **Flutter Form Builder**: For building complex forms.
-   **Logger**: Small, easy to use, and extensible logger.

## 🚀 Getting Started

### Prerequisites

-   Flutter SDK: `>=3.10.4 <4.0.0`
-   Dart SDK: `>=3.0.0`

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/flutter-boilerplate.git
    cd flutter-boilerplate
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Setup Environment Variables**:
    Copy the `.env.example` file to `.env` and configure your variables.
    ```bash
    cp .env.example .env
    ```

4.  **Run Code Generator**:
    This project uses code generation. Run the build runner to generate necessary files.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
    *Tip: Use `watch` during development to auto-generate files on change.*
    ```bash
    dart run build_runner watch --delete-conflicting-outputs
    ```

5.  **Run the App**:
    ```bash
    flutter run
    ```

## 🧪 Testing

Run unit and widget tests:

```bash
flutter test
```

## 📏 Best Practices & Guidelines

### Architecture Rules
1.  **Domain Layer** must be pure Dart (no Flutter dependencies).
2.  **Data Layer** handles external data (API, DB) and maps it to Domain Entities.
3.  **Presentation Layer** uses Riverpod Providers to interact with Usecases/Repositories.
4.  **UI** should be dumb; logic resides in Controllers/Notifiers.

### Naming Conventions
-   **Files**: `snake_case.dart`
-   **Classes**: `PascalCase`
-   **Variables/Functions**: `camelCase`

### Error Handling
-   Use `Either<Failure, Type>` return types in Repositories/Usecases (using `fpdart`).
-   Catch exceptions in Data Sources and throw custom `Exceptions`.
-   Map `Exceptions` to `Failures` in Repositories.

## 🤝 Contribution

Contributions are welcome! Please feel free to submit a Pull Request.
