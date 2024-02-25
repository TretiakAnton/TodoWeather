import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Category'),
            TextFormField(
              controller: _categoryController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Task'),
            TextFormField(
              controller: _taskController,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () async {
                if (_categoryController.text.isNotEmpty &&
                    _taskController.text.isNotEmpty) {
                  await context.read<TodoCubit>().addTodo(
                      todo: _taskController.text,
                      category: _categoryController.text);
                  if (context.mounted) {
                    GoRouter.of(context).pop();
                  }
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
