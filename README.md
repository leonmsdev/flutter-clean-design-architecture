# flutter-clean-design-architecture

This Project describes a the clean design architecture pattern for flutter applications.
The goal is to create an text widget that triggers an api, when ever a button is pressed.

## Getting Started

### 1. Install dependencies
First, install the following packages
```yaml
dartz: ^0.10.1 # Needet for functional programming
bloc: ^8.1.1 # Install bloc
flutter_bloc: ^8.1.2 # Install flutter bloc for state management
http: ^0.13. # Handles api requests
```

### 2. Folder Structure
It is recomended to follow an feature pattern folder structure inside your project.

```shell
lib/
└── api_request_feature/
    ├── application/
    │   └── bloc/
    ├── domain/
    │   ├── entities/
    │   ├── failures/
    │   ├── repositories/
    │   └── usecases/
    ├── infrastructure/
    │   ├── data_sources/
    │   ├── exeptions/
    │   ├── models/
    │   └── repositories/
    └── presentation/
        ├── pages/
        └── widgets/
```

### 2. Bloc
#### Install Bloc extention
If the Bloc Extention is installed inside VS Code, it is possible to rigth click a folder and press create Bloc. The Extention will than create the needed bloc structure.

Create the folowing folder Structure:

```shell
../application/
└── bloc/
    ├── advice_bloc.dart
    ├── advice_event.dart
    └── advice_state.dart
```

#### 2.1 Define events when button is pressed
In Bloc you have to define you events, for example if an button is pressed. Every Event gets defined as a ``class``that will extends the `àbstract class``.

```dart
part of './api_request_bloc.dart';

@immutable
abstract class ApiRequestEvent {}

/// Event when button is pressed and sould call the api request.
class ApiRequestedEvent extends ApiRequestEvent {}
```