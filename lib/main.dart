import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/routes/app_routes.dart';
import 'core/utils/snack_bar_utils.dart';
import 'modules/markdown/providers/markdown_provider.dart';

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
        initialRoute: AppRoutes.intro,
        routes: AppRoutes.routes,
      ),
    );
  }
}
