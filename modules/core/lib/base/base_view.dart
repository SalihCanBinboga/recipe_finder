import 'package:flutter/material.dart'
    show BuildContext, Builder, StatelessWidget, Widget;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, ReadContext;

import 'base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({super.key});

  T viewModelBuilder(BuildContext context);

  Widget builder(BuildContext context, T viewModel);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        return this.viewModelBuilder(context)..setContext(context);
      },
      child: Builder(
        builder: (context) {
          return builder(context, context.read<T>());
        },
      ),
    );
  }
}
