import 'package:apryt/core/main_app.dart';
import 'package:apryt/injection/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MainApp());
}
