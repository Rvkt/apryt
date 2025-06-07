// File: lib/services/bluetooth_service.dart

import 'package:flutter/services.dart';

class BluetoothDevice {
  final String name;
  final String address;
  final bool isConnected;
  final String bondState;
  final String type;

  BluetoothDevice({
    required this.name,
    required this.address,
    required this.isConnected,
    required this.bondState,
    required this.type,
  });

  factory BluetoothDevice.fromMap(Map<String, dynamic> map) {
    return BluetoothDevice(
      name: map['name'] ?? 'Unknown Device',
      address: map['address'] ?? '',
      isConnected: map['isConnected'] ?? false,
      bondState: map['bondState'] ?? 'unknown',
      type: map['type'] ?? 'unknown',
    );
  }

  @override
  String toString() {
    return 'BluetoothDevice(name: $name, address: $address, isConnected: $isConnected, bondState: $bondState, type: $type)';
  }
}

class BluetoothService {
  static const MethodChannel _channel = MethodChannel('bluetooth_channel');
  static Function(bool)? _onPermissionResult;

  static Future<void> init() async {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  /// Test method to verify method channel is working
  // static Future<String> testConnection() async {
  //   try {
  //     final result = await _channel.invokeMethod('testMethod');
  //     print('Test result: $result');
  //     return result;
  //   } catch (e) {
  //     print('Test failed: $e');
  //     throw BluetoothException('TEST_FAILED', 'Method channel test failed: $e');
  //   }
  // }

  static Future<void> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onPermissionResult':
        if (_onPermissionResult != null) {
          _onPermissionResult!(call.arguments as bool);
        }
        break;
    }
  }

  /// Get all connected Bluetooth devices
  static Future<List<BluetoothDevice>> getConnectedDevices() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod('getConnectedDevices');
      return result.map((deviceMap) => BluetoothDevice.fromMap(Map<String, dynamic>.from(deviceMap))).toList();
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Get all paired Bluetooth devices
  static Future<List<BluetoothDevice>> getPairedDevices() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod('getPairedDevices');
      return result.map((deviceMap) => BluetoothDevice.fromMap(Map<String, dynamic>.from(deviceMap))).toList();
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Get all devices (paired with connection status)
  static Future<List<BluetoothDevice>> getAllDevices() async {
    try {
      final List<dynamic> result = await _channel.invokeMethod('getAllDevices');
      return result.map((deviceMap) => BluetoothDevice.fromMap(Map<String, dynamic>.from(deviceMap))).toList();
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Check if Bluetooth is enabled
  static Future<bool> isBluetoothEnabled() async {
    try {
      return await _channel.invokeMethod('isBluetoothEnabled');
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Check if Bluetooth is supported
  static Future<bool> isBluetoothSupported() async {
    try {
      return await _channel.invokeMethod('isBluetoothSupported');
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Check if app has Bluetooth permission
  static Future<bool> hasBluetoothPermission() async {
    try {
      return await _channel.invokeMethod('hasBluetoothPermission');
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }

  /// Request Bluetooth permissions
  static Future<bool> requestBluetoothPermission() async {
    try {
      bool? result;
      _onPermissionResult = (granted) {
        result = granted;
      };

      await _channel.invokeMethod('requestBluetoothPermission');

      // Wait for permission result (with timeout)
      int attempts = 0;
      while (result == null && attempts < 50) {
        await Future.delayed(const Duration(milliseconds: 100));
        attempts++;
      }

      _onPermissionResult = null;
      return result ?? false;
    } on PlatformException catch (e) {
      throw BluetoothException(e.code, e.message ?? 'Unknown error');
    }
  }
}

class BluetoothException implements Exception {
  final String code;
  final String message;

  BluetoothException(this.code, this.message);

  @override
  String toString() => 'BluetoothException($code): $message';
}
