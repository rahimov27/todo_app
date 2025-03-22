import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  DateTime time;
  @HiveField(3)
  bool? isImportant;
  @HiveField(4)
  DateTime? dateComplete;
  @HiveField(5)
  String? subtitle;

  Todo({
    required this.time,
    required this.isDone,
    required this.title,
    this.isImportant = false,
    this.dateComplete,
    this.subtitle,
  });
}
