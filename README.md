# Wi-Fi Status Check

This Flutter app allows users to check the current Wi-Fi connection status of their device. It uses the `wifi_status` package to retrieve the status and displays whether the device is connected to Wi-Fi or not.

[![Pub Version](https://img.shields.io/pub/v/wifi_status.svg)](https://pub.dev/packages/wifi_status)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


## Features
- Displays Wi-Fi connection status: Connected or Disconnected.
- Simple and user-friendly UI.
- Option to check the status again using a button.

## Getting started

Prerequisites
Flutter 2.0+: Ensure you have Flutter 2.0 or later installed.

Dart 2.12+: The package supports Dart null safety.

## Android Setup
Add Permissions to AndroidManifest.xml
   You need to declare the following permissions in your app's AndroidManifest.xml file to request access to Wi-Fi and network state.

Open android/app/src/main/AndroidManifest.xml and add the following inside the <manifest> tag:
   ```xml
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
   ```
These permissions are required to check Wi-Fi connection status and network state.

## Usage


```dart
import 'package:flutter/material.dart';
import 'package:wifi_status/wifi_status.dart';

class WifiStatusPage extends StatefulWidget {
  @override
  _WifiStatusPageState createState() => _WifiStatusPageState();
}

class _WifiStatusPageState extends State<WifiStatusPage> {
  String _connectionStatus = 'Checking...';

  @override
  void initState() {
    super.initState();
    _checkWifiStatus();
  }

  // Method to check Wi-Fi connection status
  Future<void> _checkWifiStatus() async {
    String wifiStatus = await WifiStatus.getWifiStatus();
    setState(() {
      if (wifiStatus == WifiStatus.connected) {
        _connectionStatus = 'Connected to Wi-Fi';
      } else if (wifiStatus == WifiStatus.disconnected) {
        _connectionStatus = 'Not Connected to Wi-Fi';
      } else {
        _connectionStatus = 'Unknown Wi-Fi Status';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi Status Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wi-Fi Status:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              _connectionStatus,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _checkWifiStatus,
              child: Text('Check Again'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: WifiStatusPage()));
}

```
## Requirements
Flutter 2.0+

Dart 2.12+ (Supports null safety)

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature-name`).
6. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Contact
For any questions or issues, feel free to reach out or open an issue on the [GitHub repository](https://github.com/mahafujerrahman/wifi_status_check.git).
