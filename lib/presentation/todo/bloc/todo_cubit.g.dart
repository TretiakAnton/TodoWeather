// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoStateCWProxy {
  TodoState st(BlocStates st);

  TodoState tasks(List<Todo> tasks);

  TodoState selectedId(int? selectedId);

  TodoState doneFilters(List<bool> doneFilters);

  TodoState categoryFilters(List<String> categoryFilters);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoState call({
    BlocStates? st,
    List<Todo>? tasks,
    int? selectedId,
    List<bool>? doneFilters,
    List<String>? categoryFilters,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodoState.copyWith.fieldName(...)`
class _$TodoStateCWProxyImpl implements _$TodoStateCWProxy {
  const _$TodoStateCWProxyImpl(this._value);

  final TodoState _value;

  @override
  TodoState st(BlocStates st) => this(st: st);

  @override
  TodoState tasks(List<Todo> tasks) => this(tasks: tasks);

  @override
  TodoState selectedId(int? selectedId) => this(selectedId: selectedId);

  @override
  TodoState doneFilters(List<bool> doneFilters) =>
      this(doneFilters: doneFilters);

  @override
  TodoState categoryFilters(List<String> categoryFilters) =>
      this(categoryFilters: categoryFilters);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoState(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoState call({
    Object? st = const $CopyWithPlaceholder(),
    Object? tasks = const $CopyWithPlaceholder(),
    Object? selectedId = const $CopyWithPlaceholder(),
    Object? doneFilters = const $CopyWithPlaceholder(),
    Object? categoryFilters = const $CopyWithPlaceholder(),
  }) {
    return TodoState(
      st: st == const $CopyWithPlaceholder() || st == null
          ? _value.st
          // ignore: cast_nullable_to_non_nullable
          : st as BlocStates,
      tasks: tasks == const $CopyWithPlaceholder() || tasks == null
          ? _value.tasks
          // ignore: cast_nullable_to_non_nullable
          : tasks as List<Todo>,
      selectedId: selectedId == const $CopyWithPlaceholder()
          ? _value.selectedId
          // ignore: cast_nullable_to_non_nullable
          : selectedId as int?,
      doneFilters:
          doneFilters == const $CopyWithPlaceholder() || doneFilters == null
              ? _value.doneFilters
              // ignore: cast_nullable_to_non_nullable
              : doneFilters as List<bool>,
      categoryFilters: categoryFilters == const $CopyWithPlaceholder() ||
              categoryFilters == null
          ? _value.categoryFilters
          // ignore: cast_nullable_to_non_nullable
          : categoryFilters as List<String>,
    );
  }
}

extension $TodoStateCopyWith on TodoState {
  /// Returns a callable class that can be used as follows: `instanceOfTodoState.copyWith(...)` or like so:`instanceOfTodoState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoStateCWProxy get copyWith => _$TodoStateCWProxyImpl(this);
}
