import 'dart:math';

import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:domain/domain.dart';

import 'local_recipe_favorite_data_source_test.mocks.dart';
import 'recipes_cache_database_test.mocks.dart';

@GenerateMocks([LocalRecipeFavoriteDataSource])
void main() {
  group('LocalRecipeFavoriteDataSource', () {
    late final MockLocalRecipeFavoriteDataSource dataSource;
    late final List<Map<String, dynamic>> favoriteRecipes;

    final mockRecipe = MockRecipeEntity();

    setUpAll(
      () {
        when(mockRecipe.toJson()).thenReturn(
          {
            'id': Random().nextInt(100).toString(),
            'name': 'Mock Recipe',
            'image': 'mock-image.jpg',
          },
        );

        dataSource = MockLocalRecipeFavoriteDataSource();
        favoriteRecipes = List.generate(
          5,
          (index) => mockRecipe.toJson(),
        );
      },
    );

    test('should save a recipe when saveRecipe is called', () async {
      when(dataSource.saveRecipe(any)).thenAnswer(
        (_) async {
          favoriteRecipes.add(mockRecipe.toJson());
        },
      );

      await dataSource.saveRecipe(mockRecipe.toJson());

      verify(dataSource.saveRecipe(any)).called(1);

      expect(favoriteRecipes, contains(mockRecipe.toJson()));
    });

    test(
        'should return a list of favorite recipes when getFavoriteRecipes is called',
        () async {
      when(dataSource.getFavoriteRecipes()).thenAnswer(
        (_) async => favoriteRecipes,
      );

      final result = await dataSource.getFavoriteRecipes();

      verify(dataSource.getFavoriteRecipes()).called(1);
      expect(result, equals(favoriteRecipes));
    });

    test('should remove a recipe when removeRecipe is called', () async {
      when(dataSource.removeRecipe(any)).thenAnswer(
        (_) async {
          favoriteRecipes.removeLast();
        },
      );

      await dataSource.removeRecipe('1');

      verify(dataSource.removeRecipe(any)).called(1);

      expect(favoriteRecipes.length, equals(5));
    });
  });
}
