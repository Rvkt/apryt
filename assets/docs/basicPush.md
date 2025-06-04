```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Screen'),
          onPressed: () async {
            // Push to second screen and wait for result
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );

            // Show result from second screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Result: $result'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back with Result'),
          onPressed: () {
            // Pop screen and return data
            Navigator.pop(context, 'Hello from Second Screen');
          },
        ),
      ),
    );
  }
}

```