import 'dart:math' show Random;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/home/model/todo.dart';
import 'package:todo_app/utils/app_colors.dart';

class TodoViewmodel extends ChangeNotifier {
  late Box<Todo> _todoBox;
  List<Todo> todos = [];
  List<Todo> filteredTodos = [];
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

  Future<void> initHive() async {
    // await Hive.deleteBoxFromDisk("todos");
    _todoBox = await Hive.openBox<Todo>('todos');
    await getMessage();
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
    titleController.clear();
    subtitleController.clear();
    notifyListeners();
  }

  void selectDate() {
    // Логика выбора даты
  }

  Future<void> getMessage() async {
    todos = _todoBox.values.toList();
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    if (index >= 0 && index < todos.length) {
      final key = todos[index].key;
      print("Deleting task with key: $key");

      await _todoBox.delete(key); // Delete the task

      List<Todo> updatedTodos = _todoBox.values.toList().cast<Todo>();
      print("Updated todos: $updatedTodos");

      todos = updatedTodos; // Update the todos list
      notifyListeners(); // Notify listeners to rebuild UI
    }
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
      AppColors.appGreen,
      AppColors.pink,
      const Color.fromARGB(255, 244, 160, 44),
      AppColors.appPurple,
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

  void updateTask(
    int index, // Принимаем индекс в списке
    String title,
    String subtitle,
    DateTime time,
    DateTime date,
    double progress,
  ) async {
    if (index >= 0 && index < todos.length) {
      final todo = todos[index];
      todo.title = title;
      todo.subtitle = subtitle;
      todo.time = time;
      todo.date = date;
      todo.progress = progress;

      await _todoBox.put(todo.key, todo);
      notifyListeners();
    }
  }

  void searchTodos(String query) {
    if (query.isEmpty) {
      filteredTodos = todos;
    } else {
      filteredTodos =
          todos
              .where(
                (todo) =>
                    todo.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  List<Todo> get displayTodos {
    return filteredTodos.isNotEmpty ? filteredTodos : todos;
  }
}
