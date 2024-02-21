import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_weather/domain/models/todo/todo.dart';

class TodoRepository {
  SharedPreferences? preferences;

  Future<void> addTodo(Todo value) async {
    await initPrefs();
    List<Todo> todos = await getTodos();
    todos.add(value);
    final json = List.from(todos.map((item) => item.toJson()));
    final string = jsonEncode(json);
    await preferences?.setString(SharedKeyManager.todosKey, string);
  }

  Future<List<Todo>> getTodos() async {
    await initPrefs();
    List<Todo> result = [];
    final source = preferences?.getString(SharedKeyManager.todosKey);
    if (source != null) {
      Iterable decoded = jsonDecode(source);
      result = List<Todo>.from(decoded.map((item) => Todo.fromJson(item)));
    }
    return result;
  }

  initPrefs() async {
    preferences ??= await SharedPreferences.getInstance();
  }
}

class SharedKeyManager {
  static const todosKey = 'todos';
}
