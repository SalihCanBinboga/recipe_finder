import 'package:flutter/material.dart';

class RouteNotFoundView extends StatefulWidget {
  const RouteNotFoundView({Key? key}) : super(key: key);

  @override
  State<RouteNotFoundView> createState() => _RouteNotFoundViewState();
}

class _RouteNotFoundViewState extends State<RouteNotFoundView> {
  String routePath = '';

  @override
  void didChangeDependencies() {
    setState(() {
      routePath = ModalRoute.of(context)!.settings.name!;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for $routePath'),
      ),
    );
  }
}
