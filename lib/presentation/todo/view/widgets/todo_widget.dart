import 'package:flutter/material.dart';
import 'package:todo_weather/domain/models/todo/todo.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    Key? key,
    required this.todo,
    required this.onDetailsTap,
    required this.onCompleteTap,
    required this.onDeleteTap,
  }) : super(key: key);
  final Todo todo;
  final VoidCallback onDetailsTap;
  final VoidCallback onCompleteTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: onDetailsTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: todo.isDone
                  ? Colors.lightGreen.withOpacity(.5)
                  : Colors.deepOrangeAccent.withOpacity(.5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.category,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      todo.task,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !todo.isDone,
                child: GestureDetector(
                  onTap: onCompleteTap,
                  child: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: onDeleteTap,
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
