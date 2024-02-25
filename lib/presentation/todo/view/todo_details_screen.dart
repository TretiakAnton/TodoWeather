import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/extensions/iterable_extensions.dart';
import 'package:todo_weather/core/styles/text_styles.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            final element = state.tasks.firstWhereOrNull(
              (element) => element.id == state.selectedId,
            );
            if (element == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Category:',
                  style: AppTextStyles.size16(),
                ),
                Text(
                  element.category,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Task:',
                  style: AppTextStyles.size16(),
                ),
                Text(
                  element.task,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Description:',
                  style: AppTextStyles.size16(),
                ),
                Text(
                  element.description,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  element.isDone ? 'Completed' : 'Not completed yet',
                  style: AppTextStyles.size16(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: !element.isDone,
                  child: OutlinedButton(
                    onPressed: () async => await bloc.completeTodo(element.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Complete',
                          style: AppTextStyles.size16()
                              .copyWith(color: Colors.green),
                        ),
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    bloc.deleteTodo(element.id);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Delete',
                        style:
                            AppTextStyles.size16().copyWith(color: Colors.red),
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
