import 'package:core/core.dart' show diContainer;
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'app/init/dependency_injection/dependency_injection.dart';
import 'app/init/recipe_finder_app.dart' show RecipeFinderApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await diContainer.allReady();

  runApp(const RecipeFinderApp());
}
