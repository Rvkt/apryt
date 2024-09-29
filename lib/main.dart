import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'apryt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),
        ),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}



class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          title: const Text('apryt'),
          centerTitle: true,
          elevation: 4,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
            ),
          ),
        ),
      ),
    );
  }
}
