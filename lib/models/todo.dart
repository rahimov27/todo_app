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

  Todo({
    required this.time,
    required this.isDone,
    required this.title,
    this.isImportant = false,
  });
}
