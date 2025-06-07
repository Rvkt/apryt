import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/snack_bar_utils.dart';
import 'modules/markdown/providers/markdown_provider.dart';
import 'modules/printer/bluetooth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MarkdownProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: SnackBarUtil.messengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Apryt',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        home: BluetoothScreen(),
        // initialRoute: AppRoutes.intro,
        // routes: AppRoutes.routes,
      ),
    );
  }
}
