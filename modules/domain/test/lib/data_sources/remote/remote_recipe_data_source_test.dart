import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'remote_recipe_data_source_test.mocks.dart';

part 'mock_result_data.dart';

@GenerateMocks([RemoteRecipeDataSource])
void main() {
  group(
    'RemoteRecipeDataSource',
    () {
      late final MockRemoteRecipeDataSource remoteDataSource;

      setUp(() {
        remoteDataSource = MockRemoteRecipeDataSource();
      });

      test(
        'should return a Map of recipes when searchRecipes is called',
        () async {
          const query = 'mock query';

          when(remoteDataSource.searchRecipes(query: query)).thenAnswer(
            (_) async {
              return Future.value(jsonDecode(mockRecipeResponse));
            },
          );

          final result = await remoteDataSource.searchRecipes(query: query);

          verify(remoteDataSource.searchRecipes(query: query)).called(1);

          expect(result, isA<Map<String, dynamic>>());
          expect(result, contains('hits'));
          expect(result['hits'], isA<List>());
          expect(result['hits'], isNotEmpty);
          expect(result['hits'].first, isA<Map<String, dynamic>>());
          expect(result['hits'].first, contains('recipe'));
          expect(result['hits'].first['recipe'], isA<Map<String, dynamic>>());
        },
      );
    },
  );
}
