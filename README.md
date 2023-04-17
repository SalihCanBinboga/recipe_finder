# Recipe Finder
Recipe Finder is a mobile application that allows users to search for recipes based on keywords and view recipe details. The app also allows users to add recipes to their favorites and stores their search history.

![RecipeFinderDemo](assets/readme/example_presentation.gif)

## Features
- Recipe search: Users can search for recipes using keywords.
- Recipe details: Users can view details for any recipe by clicking on it.
- Add to favorites: Users can add recipes they like to their favorites.
- Search history: Users can view their previous searches and perform them again.

## To-do
- Add a "Random Recipe" feature for users to find a recipe randomly.
- Filter search results by dietary requirements.
- Add a recipe-sharing feature.

## Used Packages
- [dio](https://pub.dev/packages/dio "dio"): A powerful HTTP client for Dart, used for making HTTP requests.
- [json_annotation](https://pub.dev/packages/json_annotation "json_annotation"): A package used for JSON serialization/deserialization in Dart.
- [sqflite](https://pub.dev/packages/sqflite "sqflite"): A Flutter plugin for SQLite databases, used for local database storage.
- [shared_preferences](https://pub.dev/packages/shared_preferences "shared_preferences"): A Flutter plugin for storing key-value pairs on disk, used for local data storage.
- [provider](https://pub.dev/packages/provider "provider"): A Flutter package for state management, used for managing state with the Inherited Widget structure.
- [gap](https://pub.dev/packages/gap "gap"): A package for adding padding and spacing between widgets.
- [cached_network_image](https://pub.dev/packages/cached_network_image "cached_network_image"): A package for caching images from the network.
- [get_it](https://pub.dev/packages/get_it "get_it"): A package used for dependency injection in Dart and Flutter.
- [injectable](https://pub.dev/packages/injectable "injectable"): A package for generating code for dependency injection in Dart and Flutter.

## Getting Started
To run the app, you can follow these steps:

1. Clone this repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.

Note: To run the application, you need to add the following parameters when running the `flutter run` command:

1. `--dart-define="app_id=your_app_id" `
2. `--dart-define="app_key=your_app_key"`

I used the following API for food recipes.
[Edamam Recipe API](https://developer.edamam.com/edamam-docs-recipe-api "Edamam Recipe API")


## Code Generation
This project uses code generation to reduce boilerplate code and improve development speed. The following tools are used:

- [json_serializable](https://pub.dev/packages/json_serializable "json_serializable"): Used for JSON serialization/deserialization.
- [build_runner](https://pub.dev/packages/build_runner "build_runner"): Used for running code generation tasks.

To generate the code, run the following command:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate the necessary code for JSON serialization/deserialization. You should run this command every time you make changes to any files that use the @JsonSerializable annotation.

If you encounter any issues with code generation, try running the following command to clean up generated files before running build_runner:

```bash
flutter pub run build_runner clean
```


## Contributing
Contributions are always welcome! If you find any bugs or want to suggest new features, feel free to open an issue or submit a pull request.