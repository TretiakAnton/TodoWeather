import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Category'),
            TextFormField(
              controller: _categoryController,
            ),
            const Text('Task'),
            TextFormField(
              controller: _taskController,
            ),
            OutlinedButton(
              onPressed: () async {
                if (_categoryController.text.isNotEmpty &&
                    _taskController.text.isNotEmpty) {
                  await context.read<TodoCubit>().addTodo(
                      todo: _taskController.text,
                      category: _categoryController.text);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
