import 'package:flutter/material.dart';
import 'app/init/dependency_injection/dependency_injection.dart';
import 'app/init/recipe_finder_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt.allReady();

  runApp(const RecipeFinderApp());
}
