part of 'connectivity_widget.dart';

mixin NetworkStateAwareMixin on State<ConnectivityWidget> {
  final NetworkStateManager _networkChange = NetworkStateManagerImpl.instance;
  NetworkResult? networkResult;
  StreamSubscription<NetworkResult>? _subscription;

  @override
  void initState() {
    super.initState();
    waitForScreen(() {
      _subscription = _networkChange.listenNetworkChange().listen(_updateView);
      _networkChange.checkNetworkOneTime().then(_updateView);
    });
  }

  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      networkResult = result;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
