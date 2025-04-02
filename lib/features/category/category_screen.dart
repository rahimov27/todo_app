import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/home/widgets/home_todo_card.dart';
import 'package:todo_app/features/home/viewmodel/todo_viewmodel.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoViewmodel>(context);
    print(todoProvider.todos.length);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: todoProvider.todos.length,
          itemBuilder: (context, index) {
            return HomeTodoCard(
              title: todoProvider.todos[index].title,
              subtitle: todoProvider.todos[index].subtitle ?? "Нету",
              time: todoProvider.todos[index].time,
              date: todoProvider.todos[index].date,
              progress: todoProvider.todos[index].progress,
            );
          },
        ),
      ),
    );
  }
}
