import 'dart:async';

import 'package:core/enum/network_result.dart';
import 'package:core/utils/network_manager/base_network_manager.dart';
import 'package:core/utils/network_manager/network_manager.dart';
import 'package:core/extension/context_extension.dart';

import 'package:flutter/material.dart';

part 'connectivity_widget_state_mixin.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({required this.child, super.key});

  final Widget child;

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget>
    with NetworkStateAwareMixin {
  @override
  Widget build(BuildContext context) {
    final bool isNetworkUnavailable = networkResult == NetworkResult.off;

    return Stack(
      children: <Widget>[
        widget.child,
        isNetworkUnavailable
            ? const _CheckYourInternetConnectionWidget()
            : const SizedBox()
      ],
    );
  }
}

class _CheckYourInternetConnectionWidget extends StatelessWidget {
  const _CheckYourInternetConnectionWidget();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          child: Container(
            height: context.screenHeight * .06,
            color: Colors.black,
            child: const Center(
              child: Text(
                "Please check your internet connection!",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
