import 'package:json_annotation/json_annotation.dart';
part 'todos.g.dart';

@JsonSerializable()
class Todo {
  int userId;
  int id;
  String title;
  bool completed;
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
