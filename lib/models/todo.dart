import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime date; // Should be DateTime, not String

  @HiveField(2)
  DateTime time; // Should be DateTime, not String

  @HiveField(3)
  String? subtitle;

  @HiveField(4)
  double progress;

  Todo({
    required this.time,
    required this.title,
    this.subtitle,
    required this.date,
    required this.progress,
  });
}
