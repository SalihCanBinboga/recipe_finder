import 'package:flutter/material.dart'
    show BuildContext, Builder, StatelessWidget, Widget;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;

import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final T Function(BuildContext) viewModel;
  final Widget Function(BuildContext, T) builder;

  const BaseView({
    required this.viewModel,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: viewModel,
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<T>(context);
          return builder(context, viewModel);
        },
      ),
    );
  }
}
