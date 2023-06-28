sealed class BaseException implements Exception {
  const BaseException({this.message});

  final String? message;

  @override
  String toString() => message ?? runtimeType.toString();
}
