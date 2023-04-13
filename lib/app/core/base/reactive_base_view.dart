import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

abstract class ReactiveBaseView<T extends BaseViewModel, U>
    extends StatefulWidget {
  T createViewModel({
    required U routeArgument,
  });

  Widget build(BuildContext context, T viewModel);

  const ReactiveBaseView({
    super.key,
  });

  @override
  State<ReactiveBaseView<T, U>> createState() {
    return _ReactiveBaseViewState<T, U>();
  }
}

class _ReactiveBaseViewState<T extends BaseViewModel, U>
    extends State<ReactiveBaseView<T, U>> {
  late T viewModel;
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      final routeArgument = ModalRoute.of(context)?.settings.arguments;

      viewModel = widget.createViewModel(
        routeArgument: routeArgument as U,
      );

      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        return viewModel;
      },
      child: widget.build(context, viewModel),
    );
  }
}
