import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/core/bloc/bloc_states.dart';
import 'package:todo_weather/core/styles/text_styles.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your tasks',
          style: AppTextStyles.size20Bold(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.st == BlocStates.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.tasks.isEmpty) {
            return const Center(
              child: Text('You have no tasks'),
            );
          }
          return Column(
            children: [
              Container(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('data $index'),
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
