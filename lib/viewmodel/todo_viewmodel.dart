import 'dart:math' show Random;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/app_colors.dart';

class TodoViewmodel extends ChangeNotifier {
  late Box<Todo> _todoBox;
  List<Todo> todos = [];
  bool isImportant = false;

  // controller
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  // dates
  DateTime selectedTime = DateTime.now();
  DateTime selectedDate = DateTime.now();

  // progress
  double progress = 0;

  TodoViewmodel() {
    initHive();
  }

  void initHive() async {
    // await Hive.deleteBoxFromDisk("todos");
    _todoBox = await Hive.openBox<Todo>('todos');
    getMessage();
  }

  void addMessage(
    String value,
    String? subtitle,
    double progress,
    DateTime date,
    DateTime time,
  ) async {
    final todo = Todo(
      time: time,
      date: date,
      title: value,
      subtitle: subtitle ?? "Пусто",
      progress: progress,
    );
    await _todoBox.add(todo);
    todos = _todoBox.values.toList();
    notifyListeners();
  }

  void selectDate() {
    // Логика выбора даты
  }

  void getMessage() {
    todos = _todoBox.values.toList();
    notifyListeners();
  }

  void deleteTask(int index) async {
    await Future.delayed(Duration(seconds: 1));
    await _todoBox.deleteAt(index); // Удаляем задачу из Hive
    todos = _todoBox.values.toList(); // Обновляем список
    notifyListeners();
  }

  // void toggle(bool? value, int index) async {
  //   final todo = todos[index];
  //   todo.isDone = value ?? false;
  //   await _todoBox.putAt(index, todo);
  //   notifyListeners();
  // }

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

  // Очистка всех данных
  Future<void> clearAllTodos() async {
    await _todoBox.clear(); // Удаляем все задачи
    todos = []; // Очищаем список задач в приложении
    notifyListeners(); // Уведомляем слушателей об изменении
  }
}
