import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/app_colors.dart';

class TodoViewmodel extends ChangeNotifier {
  late Box<Todo> _todoBox;
  List<Todo> todos = [];
  bool isImportant = false;

  TextEditingController messageController = TextEditingController();

  TodoViewmodel() {
    initHive();
  }

  void initHive() async {
    _todoBox = await Hive.openBox<Todo>('todos');
    getMessage();
  }

  void addMessage(String value) async {
    final todo = Todo(
      time: DateTime.now(),
      isDone: false,
      title: value,
      isImportant: isImportant,
    );
    await _todoBox.add(todo);
    todos = _todoBox.values.toList();
    notifyListeners();
  }

  void getMessage() {
    todos = _todoBox.values.toList();
    notifyListeners();
  }

  void deleteTask(int index) async {
    await _todoBox.deleteAt(index); // Удаляем задачу из Hive
    todos = _todoBox.values.toList(); // Обновляем список
    notifyListeners();
  }

  void toggle(bool? value, int index) async {
    final todo = todos[index];
    todo.isDone = value ?? false;
    await _todoBox.putAt(index, todo);
    notifyListeners();
  }

  void reorderTask(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final task = todos.removeAt(oldIndex);
    todos.insert(newIndex, task);
    await updateTodo();
    notifyListeners();
  }

  Future<void> updateTodo() async {
    await _todoBox.clear();
    for (var todo in todos) {
      await _todoBox.add(todo);
    }
    notifyListeners();
  }

  Color randomColor() {
    List<Color> colors = [
      AppColors.pink,
      AppColors.red,
      AppColors.pink,
      AppColors.yellow,
    ];
    var rng = Random();
    return colors[rng.nextInt(colors.length)];
  }

  void toggleImportand(bool? value) {
    isImportant = value ?? false;
    notifyListeners();
  }
}
