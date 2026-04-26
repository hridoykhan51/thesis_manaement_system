# Thesis Management System

Flutter-based thesis management system for a university case study. The project is being developed as a cross-platform application for Android, web, and desktop so its performance and adaptability can be measured in one shared codebase.

## Current flow

- `Landing page` is the public entry screen.
- The top-right profile avatar on the landing page opens the `Login` screen.
- `Auth` is a shared feature that will be reused by student, supervisor, and admin modules.
- `Student dashboard` is the first dashboard feature connected after login.

## Tech stack

- `Flutter`
- `Dart`
- `GetX` for routing and state management
- Feature-based clean architecture

## Run the project

1. Install Flutter and confirm it with `flutter doctor`.
2. Open the project root.
3. Get packages with `flutter pub get`.
4. Run on a target platform:

```bash
flutter run -d chrome
flutter run -d windows
flutter run -d android
```

Use release mode for performance benchmarking:

```bash
flutter run --release -d chrome
flutter run --release -d windows
flutter run --release -d android
```

## Project structure

The project is organized by feature. Each feature owns its UI, logic, and business/data layers.

```text
lib/
  app/
    app.dart
    routes/
      app_pages.dart
      app_routes.dart
    theme/
      app_theme.dart

  features/
    landing_page/
      pages/
        screen/
          landing_page.dart

    auth/
      data/
        repositories/
          auth_repository_impl.dart
      domain/
        entities/
          app_user.dart
        repositories/
          auth_repository.dart
        usecases/
          sign_in_usecase.dart
          sign_out_usecase.dart
      presentation/
        bindings/
          auth_binding.dart
        controllers/
          auth_controller.dart
      pages/
        screen/
          login_page.dart

    dashboard/
      student/
        bindings/
          student_binding.dart
        controllers/
          student_controller.dart
        data/
          repositories/
            student_repository_impl.dart
        domain/
          entities/
            student.dart
          repositories/
            student_repository.dart
          usecases/
            get_student_profile_usecase.dart
        pages/
          screen/
            student_dashboard_page.dart
```

## How to follow this structure

Use this pattern when adding new features such as `supervisor`, `admin`, `proposal`, or `notification`.

1. Create a feature folder inside `lib/features/`.
2. Add `domain/` for entities, repository contracts, and use cases.
3. Add `data/` for repository implementations, API services, or local data sources.
4. Add `bindings/` and `controllers/` for GetX screen logic.
5. Add `pages/screen/` when the feature needs a screen entry file, following the same pattern as `landing_page` and `auth`.
6. Register the route in `lib/app/routes/app_routes.dart`.
7. Register the page and bindings in `lib/app/routes/app_pages.dart`.

## What each layer does

- `domain`: Pure business rules. No Flutter UI code.
- `data`: Concrete implementations of repositories and data sources.
- `bindings`: Dependency registration for a feature.
- `controllers`: GetX controllers for feature state and actions.
- `pages/screen`: UI screens for a feature entry or major page.
- `app/routes`: Central route names and route registration.
- `app/theme`: Shared app theme and visual settings.

## Current implemented features

### 1. Landing page

- Public homepage for the system
- Top-right avatar/profile login action
- Navigation to auth page

### 2. Auth feature

- Shared login flow
- Mock sign-in logic for now
- Shared controller and repository abstraction

### 3. Student dashboard

- Mock student profile loading
- Dashboard overview
- Pending task list

## Example feature expansion

If you create a supervisor module, keep the same pattern:

```text
features/
  dashboard/
    supervisor/
      data/
      domain/
      bindings/
      controllers/
      pages/
        screen/
          supervisor_dashboard_page.dart
```

## Notes for thesis work

- Keep the same codebase for all platforms.
- Build a stable baseline first.
- Add performance measurement after the core modules work.
- Compare baseline vs optimized versions using the same tasks and dataset.
- Prefer release builds for benchmark results.

## Immediate next modules

- `dashboard/supervisor`
- `dashboard/admin`
- `proposal`
- `document_submission`
- `progress_tracking`
- `notification`

## Current limitation

The data layer is still mocked. Replace repository implementations with API or database services when you start integrating real backend logic.
