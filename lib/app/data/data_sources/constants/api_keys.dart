enum ApiKeys {
  appId,
  appKey,
  recipesBaseUrl;

  String get value {
    switch (this) {
      case ApiKeys.appId:
        return const String.fromEnvironment('app_id', defaultValue: '');
      case ApiKeys.appKey:
        return const String.fromEnvironment('app_key', defaultValue: '');
      case ApiKeys.recipesBaseUrl:
        return 'https://api.edamam.com/api/recipes/v2';
    }
  }

  String get apiKey {
    switch (this) {
      case ApiKeys.appId:
        return 'app_id';
      case ApiKeys.appKey:
        return 'app_key';
      case ApiKeys.recipesBaseUrl:
        throw Exception('baseUrl is not an apiKey');
    }
  }

  bool get isForHttpHeaders {
    switch (this) {
      case ApiKeys.appId:
        return true;
      case ApiKeys.appKey:
        return true;
      case ApiKeys.recipesBaseUrl:
        return false;
    }
  }
}
