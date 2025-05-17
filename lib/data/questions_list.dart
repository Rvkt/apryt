import 'package:apryt/models/question.dart';

final List<Question> questions = [
  // 1. General Flutter Questions
  Question(
    question: 'What is Flutter and how does it differ from other mobile development frameworks?',
    answer:
        'Flutter is an open-source UI toolkit from Google that allows building natively compiled applications for mobile, web, and desktop from a single codebase. It differs by using a custom rendering engine and the Dart language.',
  ),
  Question(
    question: 'Explain the widget tree in Flutter.',
    answer:
        'The widget tree represents the UI structure in Flutter. Every element on the screen is a widget, and widgets are nested inside other widgets forming a tree-like structure.',
  ),
  Question(
    question: 'What is the difference between StatelessWidget and StatefulWidget?',
    answer: 'StatelessWidget does not maintain any state, while StatefulWidget can hold and manage state that might change during the widget\'s lifecycle.',
  ),
  Question(
    question: 'What are keys in Flutter and when should you use them?',
    answer: 'Keys help Flutter differentiate between widgets during rebuilds. They are useful in lists and other dynamic UI where maintaining widget identity is crucial.',
  ),

  // 2. Dart Language
  Question(
    question: 'What are the key features of Dart?',
    answer: 'Dart is optimized for UI, supports both JIT and AOT compilation, has sound null safety, and built-in support for asynchronous programming.',
  ),
  Question(
    question: 'How does Dart handle asynchronous programming?',
    answer: 'Dart uses Futures, async/await, and Streams to handle asynchronous operations.',
  ),
  Question(
    question: 'What is the difference between Future, async, and await?',
    answer: 'A Future represents a potential value. The async keyword allows you to use await, which pauses execution until the Future completes.',
  ),
  Question(
    question: 'What is a Stream and how is it used?',
    answer: 'A Stream provides a sequence of asynchronous data events. It is used for continuous data like user inputs or data from sockets.',
  ),

  // 3. State Management
  Question(
    question: 'What are some state management approaches you’ve used in Flutter?',
    answer: 'Examples include Provider, Bloc, Riverpod, GetX, setState, and inherited widgets.',
  ),
  Question(
    question: 'Explain the difference between Provider, Bloc, Riverpod, and GetX.',
    answer: 'Provider is simple and official; Bloc separates business logic; Riverpod is a robust, safer Provider; GetX offers ease of use and performance.',
  ),
  Question(
    question: 'When should you lift state up in Flutter?',
    answer: 'When multiple widgets need access to the same state, it should be lifted to their common ancestor.',
  ),
  Question(
    question: 'What is the best way to manage state in a large Flutter application?',
    answer: 'Use scalable solutions like Bloc or Riverpod with clear architecture and separation of concerns.',
  ),

  // 4. UI/UX & Widgets
  Question(
    question: 'How would you implement a responsive UI in Flutter?',
    answer: 'Use LayoutBuilder, MediaQuery, Flexible widgets, and responsive design principles.',
  ),
  Question(
    question: 'What is the role of MediaQuery and LayoutBuilder?',
    answer: 'MediaQuery provides screen dimensions; LayoutBuilder builds widgets based on parent constraints.',
  ),
  Question(
    question: 'Explain InheritedWidget and its use case.',
    answer: 'InheritedWidget allows widgets to efficiently share data down the widget tree. Often used in low-level state management.',
  ),
  Question(
    question: 'How do you create custom widgets?',
    answer: 'By composing other widgets into a new class, extending StatelessWidget or StatefulWidget.',
  ),

  // 5. Navigation and Routing
  Question(
    question: 'How do you navigate between screens in Flutter?',
    answer: 'Using Navigator.push, Navigator.pop, and named routes.',
  ),
  Question(
    question: 'Explain named routes vs generated routes.',
    answer: 'Named routes are predefined in MaterialApp; generated routes use onGenerateRoute for dynamic routing.',
  ),
  Question(
    question: 'How would you handle deep linking?',
    answer: 'Using packages like `uni_links` or `go_router` and configuring the native platforms to handle the links.',
  ),
  Question(
    question: 'What is Navigator 2.0 and when would you use it?',
    answer: 'Navigator 2.0 provides more control over route stacks using declarative navigation. It’s useful for complex apps like web and nested navigation.',
  ),

  // 6. APIs and Data Handling
  Question(
    question: 'How do you make HTTP requests in Flutter?',
    answer: 'Using packages like `http` or `dio` to send requests and handle responses.',
  ),
  Question(
    question: 'What packages do you use for API calls (e.g., Dio, http)?',
    answer: 'Commonly used packages are `http`, `dio`, and `chopper`.',
  ),
  Question(
    question: 'How do you handle JSON serialization?',
    answer: 'Using `dart:convert`, `json_serializable`, or manual parsing methods.',
  ),
  Question(
    question: 'How do you cache API data for offline access?',
    answer: 'Using local storage solutions like Hive, SharedPreferences, or sqflite.',
  ),

  // 7. Performance and Optimization
  Question(
    question: 'How do you optimize a Flutter app?',
    answer: 'Avoid rebuilding unnecessary widgets, use const constructors, profile using DevTools, and optimize build methods.',
  ),
  Question(
    question: 'What are some common performance issues in Flutter?',
    answer: 'Too many rebuilds, overuse of setState, blocking UI thread, large widget trees.',
  ),
  Question(
    question: 'How do you reduce widget rebuilds?',
    answer: 'Use const widgets, extract widgets, use keys properly, and avoid unnecessary state changes.',
  ),
  Question(
    question: 'What tools do you use to profile a Flutter app?',
    answer: 'Flutter DevTools, Dart Observatory, and performance overlays.',
  ),

  // 8. Testing
  Question(
    question: 'What types of testing are available in Flutter?',
    answer: 'Unit tests, widget tests, and integration tests.',
  ),
  Question(
    question: 'How do you write unit tests and widget tests?',
    answer: 'Using the `test` and `flutter_test` packages with `testWidgets` and mock data.',
  ),
  Question(
    question: 'What is the difference between a widget test and an integration test?',
    answer: 'Widget tests test individual widgets in isolation. Integration tests simulate user behavior across the entire app.',
  ),

  // 9. Platform Integration
  Question(
    question: 'How do you call native docs from Flutter?',
    answer: 'Using platform channels and method channels for Android (Kotlin/Java) and iOS (Swift/Obj-C).',
  ),
  Question(
    question: 'What is a method channel?',
    answer: 'A communication bridge between Dart and native docs used to invoke platform-specific functionality.',
  ),
  Question(
    question: 'Have you ever implemented a platform-specific feature using platform channels?',
    answer: 'Yes. For example, accessing device IMEI, camera features, or platform-specific permissions.',
  ),

  // 10. Deployment & CI/CD
  Question(
    question: 'How do you prepare a Flutter app for production?',
    answer: 'By enabling obfuscation, removing debug flags, setting app icons, signing the app, and testing thoroughly.',
  ),
  Question(
    question: 'What is flavor in Flutter and how do you manage different environments?',
    answer: 'Flavors allow creating different builds (dev, staging, prod) using build configuration files.',
  ),
  Question(
    question: 'How do you set up CI/CD for Flutter apps?',
    answer: 'Using tools like GitHub Actions, Bitrise, or Codemagic for automated build, test, and deploy pipelines.',
  ),

  // 11. Practical/Coding Questions
  Question(
    question: 'Build a custom button with animation.',
    answer: 'Use `AnimatedContainer`, `GestureDetector`, or `InkWell` with custom styling and animation logic.',
  ),
  Question(
    question: 'Show a list of items fetched from an API using FutureBuilder.',
    answer: 'Use a `FutureBuilder` widget that returns a list view when the future completes with data.',
  ),
  Question(
    question: 'Implement a login screen with form validation.',
    answer: 'Use `TextFormField`, `Form`, and `GlobalKey<FormState>` to validate fields on submission.',
  ),
  Question(
    question: 'Create a reusable widget for product cards.',
    answer: 'Define a custom `StatelessWidget` that accepts product data and displays an image, name, and price with proper styling.',
  ),
];
