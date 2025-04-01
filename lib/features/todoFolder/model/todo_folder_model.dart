import 'dart:ui';

import 'package:hive/hive.dart';
part 'todo_folder_model.g.dart';

@HiveType(typeId: 1)
class TodoFolderModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  @HiveField(3)
  int porgress;
  @HiveField(4)
  Color backgroundColor;

  TodoFolderModel({
    required this.id,
    required this.title,
    required this.porgress,
    required this.subtitle,
    required this.backgroundColor
  });
}
