import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
        return NetworkResult.on;
      case ConnectivityResult.other:
      case ConnectivityResult.none:
        return NetworkResult.off;
    }
  }
}
