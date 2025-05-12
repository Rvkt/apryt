import 'package:flutter/material.dart';

class SnackBarUtil {
  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void show(
    String message, {
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    final snackBar = SnackBar(
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      content: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) => Opacity(
          opacity: value,
          child: child,
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );

    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
