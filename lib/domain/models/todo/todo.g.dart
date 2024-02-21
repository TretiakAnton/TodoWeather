// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoCWProxy {
  Todo task(String task);

  Todo category(String category);

  Todo isDone(bool isDone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    String? task,
    String? category,
    bool? isDone,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodo.copyWith.fieldName(...)`
class _$TodoCWProxyImpl implements _$TodoCWProxy {
  const _$TodoCWProxyImpl(this._value);

  final Todo _value;

  @override
  Todo task(String task) => this(task: task);

  @override
  Todo category(String category) => this(category: category);

  @override
  Todo isDone(bool isDone) => this(isDone: isDone);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    Object? task = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
  }) {
    return Todo(
      task: task == const $CopyWithPlaceholder() || task == null
          ? _value.task
          // ignore: cast_nullable_to_non_nullable
          : task as String,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
      isDone: isDone == const $CopyWithPlaceholder() || isDone == null
          ? _value.isDone
          // ignore: cast_nullable_to_non_nullable
          : isDone as bool,
    );
  }
}

extension $TodoCopyWith on Todo {
  /// Returns a callable class that can be used as follows: `instanceOfTodo.copyWith(...)` or like so:`instanceOfTodo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoCWProxy get copyWith => _$TodoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      task: json['task'] as String,
      category: json['category'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'task': instance.task,
      'category': instance.category,
      'isDone': instance.isDone,
    };
