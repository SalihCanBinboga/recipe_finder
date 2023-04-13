import 'package:flutter/material.dart';
import 'package:recipe_finder/app/presentation/screens/home/home_view.dart';

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 13.04.2023 15:05 Create named routes structure.
    return MaterialApp(
      home: HomeView(),
    );
  }
}
