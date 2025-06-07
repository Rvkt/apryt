import 'dart:developer';

import 'package:flutter/services.dart';

class BluetoothPrinter {
  static const MethodChannel _channel = MethodChannel('bluetooth_channel');

  static Future<void> printText(String macAddress, String text) async {
    try {
      await _channel.invokeMethod('printText', {
        'macAddress': macAddress,
        'text': text,
      });
    } on PlatformException catch (e) {
      log("Failed to print: '${e.message}'.", name: 'BluetoothPrinter');
    }
  }
}
