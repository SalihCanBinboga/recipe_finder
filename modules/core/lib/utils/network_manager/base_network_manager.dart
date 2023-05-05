import 'package:core/enum/network_result.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class NetworkStateManager {
  Future<NetworkResult> checkNetworkOneTime();
  Stream<NetworkResult> listenNetworkChange();
  void dispose();
}
