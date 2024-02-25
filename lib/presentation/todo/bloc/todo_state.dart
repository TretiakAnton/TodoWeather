part of 'todo_cubit.dart';

@CopyWith()
class TodoState {
  final BlocStates st;
  final List<Todo> tasks;
  final int? selectedId;
  final List<bool> doneFilters;
  final List<String> categoryFilters;

  TodoState({
    this.st = BlocStates.completed,
    this.tasks = const [],
    this.selectedId,
    this.doneFilters = const [],
    this.categoryFilters = const [],
  });
}
