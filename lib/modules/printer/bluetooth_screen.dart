// File: lib/screens/bluetooth_screen.dart

import 'package:apryt/core/services/bluetooth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/services/bluetooth_printer.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  static const platform = MethodChannel('bluetooth_channel');
  List<BluetoothDevice> _devices = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    BluetoothService.init();
    _checkBluetoothStatus();
  }

  Future<void> _checkBluetoothStatus() async {
    try {
      // First, test the method channel
      // print('Testing method channel...');
      // final testResult = await BluetoothService.testConnection();
      // print('Method channel test result: $testResult');

      print('Checking if Bluetooth is supported...');
      final isSupported = await BluetoothService.isBluetoothSupported();
      print('Bluetooth supported: $isSupported');

      if (!isSupported) {
        setState(() {
          _errorMessage = 'Bluetooth is not supported on this device';
        });
        return;
      }

      print('Checking if Bluetooth is enabled...');
      final isEnabled = await BluetoothService.isBluetoothEnabled();
      print('Bluetooth enabled: $isEnabled');

      if (!isEnabled) {
        setState(() {
          _errorMessage = 'Please enable Bluetooth in your device settings';
        });
        return;
      }

      print('Checking Bluetooth permissions...');
      final hasPermission = await BluetoothService.hasBluetoothPermission();
      print('Has Bluetooth permission: $hasPermission');

      if (!hasPermission) {
        print('Requesting Bluetooth permissions...');
        final granted = await BluetoothService.requestBluetoothPermission();
        print('Permission granted: $granted');

        if (!granted) {
          setState(() {
            _errorMessage = 'Bluetooth permission denied. Please grant permission in app settings.';
          });
          return;
        }
      }

      print('Loading devices...');
      await _loadDevices();
    } catch (e) {
      print('Error in _checkBluetoothStatus: $e');
      setState(() {
        _errorMessage = 'Error: $e';
      });
    }
  }

  Future<void> _loadDevices() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      print('Attempting to load paired devices...');
      final devices = await BluetoothService.getPairedDevices();
      print('Loaded ${devices.length} devices: ${devices.map((d) => d.name).join(', ')}');

      setState(() {
        _devices = devices;
        _isLoading = false;
      });

      if (devices.isEmpty) {
        setState(() {
          _errorMessage = 'No paired Bluetooth devices found. Please pair a device first in your Bluetooth settings.';
        });
      }
    } catch (e) {
      print('Error loading devices: $e');
      setState(() {
        _errorMessage = 'Failed to load devices: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadConnectedDevices() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final devices = await BluetoothService.getConnectedDevices();
      setState(() {
        _devices = devices;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load connected devices: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          BluetoothPrinter.printText("24:11:F2:45:4B:7D", """
            FlashMart SUPERMARKET
         123 Main Market, Sector 21, Noida
    GSTIN: 09ABCDE1234F1Z1 | Ph: 8757237359
    Order ID: #ORD-24851 Date: 06-Jun-2025
------------------------------------------------
Qty Item                    Price         Amount
------------------------------------------------
1   Maggi 70gm              14.00          14.00
1   Aashirvaad Atta 5kg     220.00        220.00
------------------------------------------------
Subtotal:                                 268.00
Delivery Fee:                              20.00
Total Payable:                            288.00
Payment Mode:                                COD

Delivered to: Mr. Ravi Kant
Address: Ithum Tower, B716, Floor 7, Noida
Sec 62, Uttar Pradesh - 201301, India
Mobile: 9876543210

------------------------------------------------

      Thank you for shopping with FlashMart!
            For help, call 8757237359
      Powered by Easyswift Services Pvt Ltd
      \n
""");
        },
      ),
      appBar: AppBar(
        title: Text('Bluetooth Devices'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadDevices,
          ),
        ],
      ),
      body: Column(
        children: [
          // Control buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _loadDevices,
                  child: Text('All Devices'),
                ),
                ElevatedButton(
                  onPressed: _loadConnectedDevices,
                  child: Text('Connected Only'),
                ),
              ],
            ),
          ),

          // Error message
          if (_errorMessage.isNotEmpty)
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade300),
              ),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red.shade800),
              ),
            ),

          // Loading indicator
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),

          // Devices list
          Expanded(
            child: _devices.isEmpty && !_isLoading
                ? Center(
                    child: Text(
                      'No devices found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _devices.length,
                    itemBuilder: (context, index) {
                      final device = _devices[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: Icon(
                            device.isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
                            color: device.isConnected ? Colors.green : Colors.grey,
                          ),
                          title: Text(
                            device.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address: ${device.address}'),
                              Text('Bond State: ${device.bondState}'),
                              Text('Type: ${device.type}'),
                            ],
                          ),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: device.isConnected ? Colors.green.shade100 : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: device.isConnected ? Colors.green.shade300 : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              device.isConnected ? 'Connected' : 'Paired',
                              style: TextStyle(
                                color: device.isConnected ? Colors.green.shade800 : Colors.grey.shade800,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
