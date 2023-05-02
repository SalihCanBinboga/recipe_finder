import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/enum/network_result.dart';
import 'package:core/utils/network_manager/base_network_manager.dart';

class NetworkManagerImpl extends NetworkManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  static NetworkManagerImpl? _instance;
  static NetworkManagerImpl get instance =>
      _instance ??= NetworkManagerImpl._();

  NetworkManagerImpl._() {
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkResult> checkNetworkOneTime() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  @override
  void handleNetworkChange(NetworkCallBack onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkResult.checkConnectivityResult(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
