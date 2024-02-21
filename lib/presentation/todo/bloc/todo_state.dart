part of 'todo_cubit.dart';

@CopyWith()
class TodoState {
  final BlocStates st;
  final List<Todo> tasks;

  TodoState({
    this.st = BlocStates.completed,
    this.tasks = const [],
  });
}
