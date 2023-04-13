import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/init/dependency_injection/dependency_injection.dart';
import 'app/init/recipe_finder_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  configureDependencies();

  runApp(const RecipeFinderApp());
}
