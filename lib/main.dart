/*
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bluetooth Demo',
      home: BluetoothPage(),
    );
  }
}

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBluePlus _flutterBlue = FlutterBluePlus.instance;
  List<BluetoothDevice> _devicesList = [];

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  @override
  void dispose() {
    _stopScan();
    super.dispose();
  }

  void _startScan() {
    _flutterBlue.startScan(timeout: Duration(seconds: 20));
    _flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult r in results) {
        if (r.device.name.isNotEmpty) {
          setState(() {
            _devicesList.add(r.device);
          });
        }
      }
    });
  }

  void _stopScan() {
    _flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bluetooth Demo"),
      ),
      body: Center(
        child: _devicesList.isEmpty
            ? Text("No devices found")
            : ListView.builder(
                itemCount: _devicesList.length,
                itemBuilder: (context, index) {
                  BluetoothDevice device = _devicesList[index];
                  return ListTile(
                    title: Text(device.name),
                    subtitle: Text(device.id.toString()),
                  );
                },
              ),
      ),
    );
  }
}
*/
// ignore_for_file: must_be_immutable

import 'package:artie/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
