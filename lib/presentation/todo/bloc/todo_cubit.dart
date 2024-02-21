import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/data/repo/todo_repo.dart';
import 'package:todo_weather/domain/models/todo/todo.dart';

part 'todo_state.dart';

part 'todo_cubit.g.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(super.initialState);

  final TodoRepository _repository = TodoRepository();

  addTodo({required String todo, required String category}) async {
    await _repository.addTodo(Todo(
      task: todo,
      category: category,
      isDone: false,
    ));
    await getTodos();
  }

  getTodos() async {
    ///loading only if it's empty list before
    ///to not show loader when updating todos
    final needLoading = state.tasks.isEmpty;
    if (needLoading) {
      emit(state.copyWith(st: BlocStates.loading));
    }
    final todos = await _repository.getTodos();
    emit(state.copyWith(tasks: todos, st: BlocStates.completed));
  }
}
