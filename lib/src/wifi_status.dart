import 'package:connectivity_plus/connectivity_plus.dart';

class WifiStatus {

  static const String connected = "Connected";
  static const String disconnected = "Disconnected";
  static const String unknown = "Not Find";

  // Check Wi-Fi status
  static Future<String> getWifiStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.wifi) {
      return connected;
    } else if (connectivityResult == ConnectivityResult.none) {
      return disconnected;
    } else {
      return unknown;
    }
  }
}
