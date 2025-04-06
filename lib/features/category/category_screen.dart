import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/home/widgets/home_search.dart';
import 'package:todo_app/features/home/widgets/home_todo_card.dart';
import 'package:todo_app/features/home/viewmodel/todo_viewmodel.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoViewmodel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 24),
            HomeSearch(onChanged: (value) => todoProvider.searchTodos(value)),
            SizedBox(height: 24),
            todoProvider.displayTodos.isNotEmpty
                ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoProvider.displayTodos.length,
                    itemBuilder: (context, index) {
                      final todo = todoProvider.displayTodos[index];
                      return HomeTodoCard(
                        title: todo.title,
                        subtitle: todo.subtitle ?? "Нету",
                        time: todo.time,
                        date: todo.date,
                        progress: todo.progress,
                      );
                    },
                  ),
                )
                : Column(
                  children: [
                    HomeTodoCard(
                      title: "Добавляйте свои задачи",
                      subtitle: "Пишите свои описания",
                      time: DateTime.now(),
                      date: DateTime.now(),
                      progress: 35,
                    ),
                    HomeTodoCard(
                      title: "Добавляйте свои задачи",
                      subtitle: "Пишите свои описания",
                      time: DateTime.now(),
                      date: DateTime.now(),
                      progress: 80,
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
