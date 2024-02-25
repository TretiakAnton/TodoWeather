import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/core/navigation/routes.dart';
import 'package:todo_weather/core/styles/text_styles.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';
import 'package:todo_weather/presentation/todo/view/widgets/filter_widget.dart';
import 'package:todo_weather/presentation/todo/view/widgets/todo_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your tasks',
          style: AppTextStyles.size20Bold(),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppPages.toWeatherScreen);
            },
            child: const Row(
              children: [
                Text('Weather'),
                SizedBox(width: 10),
                Icon(Icons.wb_sunny),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          GoRouter.of(context).push(AppPages.toAddTodoScreen);
        },
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.st == BlocStates.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              _FiltersSection(
                visible: state.tasks.isNotEmpty,
                filtersApplied: bloc.filtersApplied(),
              ),
              state.tasks.isEmpty || bloc.tasks().isEmpty
                  ? _EmptyWidget(isTasksEmpty: state.tasks.isEmpty)
                  : Expanded(
                      child: ListView.builder(
                        itemCount: bloc.tasks().length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = bloc.tasks()[index];
                          return TodoWidget(
                            todo: item,
                            onDetailsTap: () {
                              bloc.setSelectedId(item.id);
                              GoRouter.of(context)
                                  .push(AppPages.toTodoDetailsScreen);
                            },
                            onCompleteTap: () async =>
                                await bloc.completeTodo(item.id),
                            onDeleteTap: () async =>
                                await bloc.deleteTodo(item.id),
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _FiltersSection extends StatelessWidget {
  const _FiltersSection({
    required this.visible,
    required this.filtersApplied,
  });

  final bool visible;
  final bool filtersApplied;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            filtersApplied ? 'Applied filters' : 'Filters',
            style: AppTextStyles.size16(),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              _showPopup(context);
            },
            child: Icon(
              Icons.filter_list,
              color: filtersApplied ? Colors.deepOrange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({required this.isTasksEmpty});

  final bool isTasksEmpty;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200),
          Text(
            isTasksEmpty ? 'You have no tasks' : 'No tasks with that filters',
          ),
        ],
      ),
    );
  }
}

Future<void> _showPopup(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => const FilterWidget(),
  );
}
