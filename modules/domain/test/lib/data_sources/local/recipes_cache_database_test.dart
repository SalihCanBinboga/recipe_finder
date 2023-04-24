import 'package:domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'recipes_cache_database_test.mocks.dart';

@GenerateMocks([RecipesCacheDatabase, RecipeEntity])
void main() {
  group(
    'RecipesCacheDatabase',
    () {
      late final MockRecipesCacheDatabase mockRecipesCacheDatabase;
      late final List<MockRecipeEntity> mockRecipes;

      setUpAll(
        () {
          mockRecipesCacheDatabase = MockRecipesCacheDatabase();
          mockRecipes = List.generate(
            5,
            (index) => MockRecipeEntity(),
          );
        },
      );

      test(
        'should return cached recipes when getRecipes is called',
        () async {
          final mockDatabase = MockRecipesCacheDatabase();

          when(mockDatabase.getRecipes()).thenAnswer((_) async => mockRecipes);
          final result = await mockDatabase.getRecipes();

          expect(result, isA<Iterable<RecipeEntity>>());
          expect(result, equals(mockRecipes));

          verify(mockDatabase.getRecipes()).called(1);
        },
      );

      test(
        'should cache recipes when cacheRecipes is called',
        () async {
          when(mockRecipesCacheDatabase.cacheRecipes(mockRecipes)).thenAnswer(
            (_) async {
              mockRecipes.add(MockRecipeEntity());
            },
          );

          await mockRecipesCacheDatabase.cacheRecipes(mockRecipes);
          verify(mockRecipesCacheDatabase.cacheRecipes(mockRecipes)).called(1);

          expect(mockRecipes.length, equals(6));
        },
      );

      test(
        'should clear the cached recipes',
        () async {
          when(mockRecipesCacheDatabase.clearCache()).thenAnswer(
            (_) async {
              mockRecipes.clear();
            },
          );

          await mockRecipesCacheDatabase.clearCache();
          verify(mockRecipesCacheDatabase.clearCache()).called(1);

          expect(mockRecipes.length, equals(0));
        },
      );
    },
  );
}
