import 'package:core/enum/network_result.dart';

typedef NetworkCallBack = void Function(NetworkResult result);

abstract class NetworkManager {
  Future<NetworkResult> checkNetworkOneTime();
  void handleNetworkChange(NetworkCallBack onChange);
  void dispose();
}
