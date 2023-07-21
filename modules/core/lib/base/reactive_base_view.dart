import 'package:core/base/view_args.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

abstract class ReactiveBaseView<T extends BaseViewModel, U>
    extends StatefulWidget {
  T createViewModel(U routeArgument);

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
      U routeArgument = _getRouteArguments();

      viewModel = widget.createViewModel(routeArgument);

      isInit = true;
    }
    super.didChangeDependencies();
  }

  U _getRouteArguments() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments;
    final viewArgs = routeArgument as ViewArgs;

    return viewArgs.data as U;
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
