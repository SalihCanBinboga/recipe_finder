enum ApiKeys {
  appId,
  appKey;

  String get value {
    switch (this) {
      case ApiKeys.appId:
        return const String.fromEnvironment('app_id', defaultValue: '');
      case ApiKeys.appKey:
        return const String.fromEnvironment('app_key', defaultValue: '');
    }
  }

  String get apiKey {
    switch (this) {
      case ApiKeys.appId:
        return 'app_id';
      case ApiKeys.appKey:
        return 'app_key';
    }
  }
}
