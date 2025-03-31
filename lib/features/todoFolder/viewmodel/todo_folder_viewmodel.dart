import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/features/todoFolder/model/todo_folder_model.dart';
import 'package:uuid/uuid.dart';

class TodoFolderViewmodel extends ChangeNotifier {
  List<TodoFolderModel> folderModels = [];
  final Uuid _uuid_ = Uuid();

  // Box
  late Box<TodoFolderModel> _todoFolderBox;

  // controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  TodoFolderViewmodel() {
    initHive();
  }

  // init hive
  void initHive() async {
    _todoFolderBox = await Hive.openBox('folderBox');
    getMessage();
  }

  void addFolder() async {
    final todoFolder = TodoFolderModel(
      id: _uuid_.v4(),
      title: titleController.text,
      porgress: 20,
      subtitle: subtitleController.text,
    );
    await _todoFolderBox.add(todoFolder);
    folderModels = _todoFolderBox.values.toList();
    notifyListeners();
  }

  void getMessage() {
    folderModels = _todoFolderBox.values.toList();
    notifyListeners();
  }
}
