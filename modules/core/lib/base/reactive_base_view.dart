// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';
import 'view_args.dart';

abstract class ReactiveBaseView<T extends BaseViewModel>
    extends StatefulWidget {
  const ReactiveBaseView({
    super.key,
  });

  T createViewModel();

  Widget build(BuildContext context, T viewModel);

  @override
  State<ReactiveBaseView<T>> createState() {
    return _ReactiveBaseViewState<T>();
  }
}

class _ReactiveBaseViewState<T extends BaseViewModel>
    extends State<ReactiveBaseView<T>> {
  late T viewModel;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      viewModel = widget.createViewModel();

      final Object? routeArgument = _getRouteArguments();

      viewModel.args = routeArgument;

      isInit = true;
    }
    super.didChangeDependencies();
  }

  Object? _getRouteArguments() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments;

    if (routeArgument == null) {
      return null;
    }

    final viewArgs = routeArgument as ViewArgs;

    return viewArgs.data;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        viewModel.setContext(context);
        return viewModel;
      },
      child: Consumer<T>(
        builder: (BuildContext context, _, __) {
          return widget.build(context, viewModel);
        },
      ),
    );
  }
}
