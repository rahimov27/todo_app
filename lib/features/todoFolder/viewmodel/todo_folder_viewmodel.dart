import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/features/todoFolder/model/todo_folder_model.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:uuid/uuid.dart';

class TodoFolderViewmodel extends ChangeNotifier {
  // list of folderModels
  List<TodoFolderModel> folderModels = [];

  // uuid for automatically generate id
  final Uuid _uuid_ = Uuid();

  // Box
  late Box<TodoFolderModel> _todoFolderBox;

  // controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  // color method
  bool colorSelected = false;

  Color folderColorDefault = AppColors.pink;

  // init hive method
  TodoFolderViewmodel() {
    initHive();
  }

  // init hive
  void initHive() async {
    _todoFolderBox = await Hive.openBox('folderBox');
    // await Hive.deleteBoxFromDisk("folderBox");
    getMessage();
  }

  // add folder method
  void addFolder() async {
    final todoFolder = TodoFolderModel(
      id: _uuid_.v4(),
      title: titleController.text,
      porgress: 20,
      subtitle: subtitleController.text,
      backgroundColor: folderColorDefault,
    );
    await _todoFolderBox.add(todoFolder);
    folderModels = _todoFolderBox.values.toList();
    titleController.clear();
    subtitleController.clear();
    notifyListeners();
  }

  // getting message method
  void getMessage() {
    folderModels = _todoFolderBox.values.toList();
    notifyListeners();
  }

  // color selecte method
  void selectColor(Color color) {
    colorSelected = !colorSelected;
    folderColorDefault = color;
    notifyListeners();
  }

  Future<void> deleteFolder(int index) async {
    await _todoFolderBox.deleteAt(index);
    folderModels = _todoFolderBox.values.toList();
    notifyListeners();
  }
}
