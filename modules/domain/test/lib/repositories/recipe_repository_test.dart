import 'package:domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'recipe_repository_test.mocks.dart';

@GenerateMocks([RecipeRepository])
void main() {
  group('RecipeRepository', () {
    late final MockRecipeRepository repository;
    late final List<RecipeEntity> mockRecipes;
    late final List<RecipeEntity> favoriteRecipes;

    setUpAll(() {
      repository = MockRecipeRepository();
      mockRecipes = [
        const RecipeEntity(
          id: '1',
          name: 'Pasta',
          imageUrl: 'https://example.com/pasta.jpg',
          ingredients: ['flour', 'eggs', 'water', 'salt'],
          ingredientLines: [
            '1 cup flour',
            '1 egg',
            '1/2 cup water',
            '1/2 tsp salt'
          ],
          url: 'https://example.com/pasta',
        ),
        const RecipeEntity(
          id: '2',
          name: 'Pizza',
          imageUrl: 'https://example.com/pizza.jpg',
          ingredients: ['flour', 'tomatoes', 'cheese', 'pepperoni'],
          ingredientLines: [
            '1 cup flour',
            '1 tomato',
            '1/2 cup cheese',
            '6 slices pepperoni'
          ],
          url: 'https://example.com/pizza',
        ),
        const RecipeEntity(
          id: '3',
          name: 'Burger',
          imageUrl: 'https://example.com/burger.jpg',
          ingredients: ['beef', 'lettuce', 'tomato', 'bun'],
          ingredientLines: [
            '1/4 lb beef',
            '1 leaf lettuce',
            '1 tomato slice',
            '1 bun'
          ],
          url: 'https://example.com/burger',
        ),
      ];
      favoriteRecipes = [];
    });

    test('searchRecipes returns matching recipes', () async {
      const query = 'Pasta';
      when(repository.searchRecipes(query: anyNamed('query'))).thenAnswer(
        (realInvocation) {
          return Future.value(
            mockRecipes
                .where(
                  (recipe) => recipe.name.contains(query),
                )
                .toList(),
          );
        },
      );

      final results = await repository.searchRecipes(query: query);

      verify(repository.searchRecipes(query: query)).called(1);

      expect(results, isA<List<RecipeEntity>>());
      expect(results, hasLength(1));
      expect(results.first.id, equals('1'));
    });

    test('getFavoriteRecipes returns favorite recipes', () async {
      when(repository.getFavoriteRecipes()).thenAnswer(
        (_) async => favoriteRecipes,
      );

      final results = await repository.getFavoriteRecipes();
      expect(results, hasLength(0));

      favoriteRecipes.add(mockRecipes[0]);
      final newResults = await repository.getFavoriteRecipes();
      expect(newResults, hasLength(1));
      expect(newResults.first.id, equals(mockRecipes[0].id));
    });

    test('addFavoriteRecipe adds recipe to favorites', () async {
      favoriteRecipes.clear();

      final recipe = mockRecipes.first;
      expect(favoriteRecipes, hasLength(0));

      when(repository.addFavoriteRecipe(recipe)).thenAnswer(
        (_) async {
          favoriteRecipes.add(recipe);
        },
      );

      await repository.addFavoriteRecipe(recipe);
      expect(favoriteRecipes, hasLength(1));
    });

    test('removeFavoriteRecipe removes recipe from favorites', () async {
      favoriteRecipes.clear();
      favoriteRecipes.add(mockRecipes.first);

      final recipe = mockRecipes.first;
      expect(favoriteRecipes, hasLength(1));

      when(repository.removeFavoriteRecipe(recipe)).thenAnswer(
        (_) async {
          favoriteRecipes.remove(recipe);
        },
      );

      await repository.removeFavoriteRecipe(recipe);
      expect(favoriteRecipes, hasLength(0));
    });

    test('getRecipes returns all recipes', () async {
      when(repository.getRecipes()).thenAnswer((_) async => mockRecipes);

      final results = await repository.getRecipes();
      expect(results, hasLength(3));
      expect(results.map((recipe) => recipe.id), containsAll(['1', '2', '3']));

      expect(results.first.name, equals('Pasta'));
      expect(results.first.imageUrl, equals('https://example.com/pasta.jpg'));
      expect(results.first.ingredients,
          containsAll(['flour', 'eggs', 'water', 'salt']));
      expect(
          results.first.ingredientLines,
          containsAll(
              ['1 cup flour', '1 egg', '1/2 cup water', '1/2 tsp salt']));
      expect(results.first.url, equals('https://example.com/pasta'));
    });
  });
}
