# Quick Eats

## Overview
This Flutter project embraces the Stacked architecture, a powerful and efficient design pattern that promotes maintainability, scalability, and separation of concerns. Stacked is particularly well-suited for Flutter applications, providing a structured and organized approach to building robust and modular codebases.


## Installation flutter
[![Flutter Version](https://img.shields.io/badge/Flutter-v3.19.4-blue)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-v3.3.2-blue)](https://dart.dev/)

### Prerequisites(Installation Android Studio)

- [Android Studio](https://developer.android.com/studio) with Flutter plugin
- Emulator or physical device for testing


### Steps for installation project and run project
1. **Clone the repository:**
    git clone https://github.com/vijay-malethia/QuickEats

2. **Navigate to the project directory:**
    cd explrar

3. **Install dependencies:**
    flutter pub get
    
4. **Run the app:**
    flutter run
    

## Project Structure
Organized codebase using best practices for maintainability and scalability:

- `lib/`: Main Dart code for the Flutter app.
  - `ui/views/`: Distinct screens for various app sections.
  - `ui/view/viewmodels/`: Implementation of Stacked architecture for efficient business logic.
  - `services/`: Modular services for handling diverse functionalities.
  - `ui/widgets/common`: Reusable widgets promoting UI consistency.


## How to use mock API
The mock API simulates server interactions by providing predefined responses, crucial for frontend development especially when the backend isn't available. This section details how to set up Dio for HTTP requests and configure it to use a mock API endpoint

### Mock Api
1. **Setup dio for http/https requests**
     Firstly, you need to initialize Dio when the application starts up, typically in a service locator or directly within your main business logic files.
     After that create service to handle api calls. And finally you can use that sevice to make api calls.
     
2. **Base url:**
     https://quickeats.free.beeceptor.com

3. **Endpoint to fetch all restaurants**
     /restaurants


