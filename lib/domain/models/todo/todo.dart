import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'todo.g.dart';

@CopyWith()
@JsonSerializable()
class Todo {
  final String task;
  final String category;
  final bool isDone;
  final int id;

  Todo({
    required this.task,
    required this.category,
    required this.isDone,
    required this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
