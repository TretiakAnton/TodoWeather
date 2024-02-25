import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_weather/presentation/todo/bloc/todo_cubit.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoCubit>();
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Filters'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterButton(
                    title: 'Done',
                    selected: state.doneFilters.contains(true),
                    onTap: () => bloc.setDoneFilter(true),
                  ),
                  const SizedBox(width: 10),
                  FilterButton(
                    title: 'Not done',
                    selected: state.doneFilters.contains(false),
                    onTap: () => bloc.setDoneFilter(false),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  bloc.availableCategories().length,
                  (index) {
                    final item = bloc.availableCategories()[index];
                    return FilterButton(
                      title: item,
                      selected: state.categoryFilters.contains(item),
                      onTap: () => bloc.setCategoryFilter(item),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
