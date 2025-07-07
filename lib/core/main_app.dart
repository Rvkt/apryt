import 'package:apryt/core/navigation/app_routes.dart';
import 'package:apryt/modules/markdown/providers/markdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/snack_bar_utils.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
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
        // home: IntroScreen(),
        initialRoute: AppRoutes.intro,
        routes: AppRoutes.routes,
      ),
    );
  }
}
