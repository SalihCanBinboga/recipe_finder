import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/enum/network_result.dart';
import 'package:core/utils/network_manager/base_network_manager.dart';

class NetworkStateManagerImpl extends NetworkStateManager {
  static NetworkStateManagerImpl? _instance;

  static NetworkStateManagerImpl get instance {
    return _instance ??= NetworkStateManagerImpl._();
  }

  late final Connectivity _connectivity;

  NetworkStateManagerImpl._() {
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkResult> checkNetworkOneTime() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return NetworkResult.checkConnectivityResult(connectivityResult);
  }

  @override
  Stream<NetworkResult> listenNetworkChange() {
    return _connectivity.onConnectivityChanged.map(
      (event) => NetworkResult.checkConnectivityResult(event),
    );
  }

  @override
  void dispose() {
    _instance = null;
  }
}
