import 'package:flutter/material.dart'
    show BuildContext, Builder, StatelessWidget, Widget;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;

import 'base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({super.key});

  T viewModel(BuildContext context);

  Widget builder(BuildContext context, T viewModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel(context),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<T>(context);
          return builder(context, viewModel);
        },
      ),
    );
  }
}
