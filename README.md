# apryt

## Getting Started

**apryt** is a developer-focused app designed to help you test and experiment with various Flutter concepts. This app provides a hands-on platform for exploring key topics such as widgets, layouts, state management, animations, and more. It's perfect for developers looking to enhance their Flutter skills through practical experimentation.

### Features:
- Test custom widgets and layouts
- Experiment with state management techniques
- Explore animations and interactions
- Integrate with native Android code

### Requirements:
- Flutter SDK (latest stable version)
- Dart (latest version)
- Android Studio / VS Code (for development)


### Features
#### PopScope
```dart

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
```
```dart
class _HomepageState extends State<Homepage> {
  Future<bool?> _showDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit the App?'),
          content: const Text('Are you sure you want to leave the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes, exit the app'),
              onPressed: () {
                // Return true to indicate the user confirmed exit
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              child: const Text('No, stay in the app'),
              onPressed: () {
                // Return false to indicate the user canceled the exit
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showDialog() ?? false;
        if (shouldPop) {
          // Since this is the root route, quit the app where possible by
          // invoking the SystemNavigator. If this wasn't the root route,
          // then Navigator.maybePop could be used instead.
          // See https://github.com/flutter/flutter/issues/11490
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }
}
```



```dart
AppBar _buildAppBar() {
  return AppBar(
    title: const Text('apryt'),
    centerTitle: true,
    elevation: 4,
  );
}

```

```dart
Center _buildBody(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: _buildContent(context),
    ),
  );
}
```
```dart
Column _buildContent(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Welcome to apryt!',
        style: Theme.of(context).textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      Text(
        'Your playground for Flutter concepts and experimentation.',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    ],
  );
}
```