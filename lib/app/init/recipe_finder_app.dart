import 'package:flutter/material.dart';
import 'package:recipe_finder/app/presentation/screens/home/home_view.dart';

class RecipeFinderApp extends StatelessWidget {
  const RecipeFinderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
