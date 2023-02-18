# flutter-clean-design-architecture

This project describes the Clean Design Architecture pattern for Flutter applications, which provides a structured and organized approach to developing high-quality apps.

The ultimate goal of the project is to create a text widget that triggers an API request whenever a button is pressed. By following the Clean Design Architecture pattern, we can ensure that the code is modular, maintainable, and easy to understand, making it simpler to enhance and extend the app's functionality over time.

## Getting Started

### 1. Install dependencies
First, install the following packages
```yaml
dartz: ^0.10.1 # Needet for functional programming
bloc: ^8.1.1 # Install bloc
flutter_bloc: ^8.1.2 # Install flutter bloc for state management
http: ^0.13. # Handles api requests
```
##
### 2. Folder Structure
For best practices, it's recommended to adopt a feature-based folder structure within your project. By organizing your files and folders in this way, you can effectively manage and maintain the different features of your app, making it easier to understand and update in the future.

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
##
### 2. Bloc
#### Install Bloc extention
If you have the Bloc Extension installed in your VS Code environment, you can easily create a Bloc structure by simply right-clicking on a folder and selecting "Create Bloc". This will prompt the Extension to generate the required files and folders for your Bloc, allowing you to focus on the app's logic and functionality without worrying about the underlying architecture.

Create the folowing folder Structure:

```shell
../application/
└── bloc/
    ├── advice_bloc.dart
    ├── advice_event.dart
    └── advice_state.dart
```
#
#### 2.1 Define events when button is pressed
When using Bloc, it's important to define your events in advance, such as when a button is pressed. Each event should be defined as a class that extends the abstract class.
By following this approach, you can effectively manage the different events that occur within your app, ensuring that it runs smoothly and efficiently.

```dart
// advice_event.dart
part of './api_request_bloc.dart';

@immutable
abstract class AdviceEvent {}

/// Event when button is pressed and sould call the api request.
class AdviceRequestedEvent extends AdviceEvent {}
```
#
#### 2.2 Define state of the widget
Once the events have been defined, it's essential to specify the various states that the widgets can assume. These might include states such as ``loading, loaded, or error.`` The "initial" state is the first state that the widget will display when it's rendered.

To create a state, follow a similar process as for creating an event. Define a class that extends the abstract class AdviceState. This will allow you to manage the widget's state in a structured and organized manner.

```dart
// advice_state.dart
part of './api_request_bloc.dart';

@immutable
abstract class AdviceState {}

// Defines the first state when Widget is loaded
class ApiRequestInitial extends AdviceState {}

class ApiRequestLoading extends AdviceState {}

class ApiRequestLoaded extends AdviceState {
  final String advice;
  ApiRequestLoaded({required this.advice});
}

class ApiRequestError extends AdviceState {
  final String error;
  ApiRequestError({required this.error});
}
```

**Initialise Block Provider**
To initialize the app, simply wrap the parent widget with a BlocProvider. This will enable all underlying widgets to seamlessly use the Bloc with the BlocBuilder Widget. Additionally, you can define various providers within the providers array to further enhance the app's functionality.
```dart
// main.dart
home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AdviceBloc(),
          ),
        ],
        child: const MyHomePage(),
      ),
```

