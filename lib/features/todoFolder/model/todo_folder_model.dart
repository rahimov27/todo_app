import 'package:hive/hive.dart';
part 'todo_folder_model.g.dart';

@HiveType(typeId: 1)
class TodoFolderModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  @HiveField(3)
  int porgress;

  TodoFolderModel({
    required this.id,
    required this.title,
    required this.porgress,
    required this.subtitle,
  });
}
