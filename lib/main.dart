import 'package:apryt/modules/intro/intro_screen.dart';
import 'package:apryt/modules/navigation/navigation_screen.dart';
import 'package:flutter/material.dart';

import 'core/utils/snack_bar_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackBarUtil.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Apryt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroScreen(),
        '/navigation': (context) => NavigationScreen(),
      },
    );
  }
}
