import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/data/repo/todo_repo.dart';
import 'package:todo_weather/domain/models/todo/todo.dart';

part 'todo_state.dart';

part 'todo_cubit.g.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());

  final TodoRepository _repository = TodoRepository();

  setSelectedId(int id) {
    emit(state.copyWith(selectedId: id));
  }

  List<String> availableCategories() {
    Set<String> filters = {};
    for (Todo element in state.tasks) {
      filters.add(element.category);
    }
    return filters.toList();
  }

  bool filtersApplied() {
    return state.doneFilters.isNotEmpty || state.categoryFilters.isNotEmpty;
  }

  List<Todo> tasks() {
    List<Todo> filtered = state.tasks;
    if (!filtersApplied()) {
      return filtered;
    } else {
      /// filter by done status
      if (state.doneFilters.isNotEmpty) {
        filtered = filtered
            .where((todo) => state.doneFilters.contains(todo.isDone))
            .toList();
      }

      /// filter by category
      if (state.categoryFilters.isNotEmpty) {
        filtered = filtered
            .where((todo) => state.categoryFilters.contains(todo.category))
            .toList();
      }
      return filtered;
    }
  }

  setDoneFilter(bool value) {
    ///true in doneFilters is for done, false for not done
    final isAdd = !state.doneFilters.contains(value);
    final List<bool> oldFilters = List.from(state.doneFilters);
    isAdd ? oldFilters.add(value) : oldFilters.remove(value);
    emit(state.copyWith(doneFilters: oldFilters));
  }

  setCategoryFilter(String value) {
    ///categories is String so, applied filters are list of Strings
    final isAdd = !state.categoryFilters.contains(value);
    final List<String> oldFilters = List.from(state.categoryFilters);
    isAdd ? oldFilters.add(value) : oldFilters.remove(value);
    emit(state.copyWith(categoryFilters: oldFilters));
  }

  addTodo({required String todo, required String category}) async {
    await _repository.addTodo(Todo(
      task: todo,
      category: category,
      isDone: false,
      id: Random().nextInt(10000),
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

  deleteTodo(int id) async {
    await _repository.deleteTodo(id);
    await getTodos();
  }

  completeTodo(int id) async {
    await _repository.completeTodo(id);
    await getTodos();
  }
}
