import 'package:core/enum/network_result.dart';
import 'package:core/utils/network_manager/base_network_manager.dart';
import 'package:core/utils/network_manager/network_manager.dart';
import 'package:flutter/material.dart';
part 'connectivity_widget_state_mixin.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({super.key});

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget>
    with StateAwareMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: MAKE GLOBAL SIZES
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 500),
        crossFadeState: _networkResult == NetworkResult.off
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Container(
          height: size.height * .06,
          color: Colors.black,
          child: const Center(
            child: Text(
              "Please Check Internet Your Connection !",
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        secondChild: const SizedBox(),
      ),
    );
  }
}
