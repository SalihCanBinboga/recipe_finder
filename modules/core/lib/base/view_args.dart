import 'package:flutter/material.dart';

@immutable
final class ViewArgs<T extends Object?> {
  const ViewArgs({
    required this.data,
    this.meta = const <String, dynamic>{},
  });

  final T data;
  final Map<String, dynamic> meta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewArgs &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;

  ViewArgs<T> copyWith({
    T? data,
    Map<String, dynamic>? meta,
  }) {
    return ViewArgs<T>(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }
}
