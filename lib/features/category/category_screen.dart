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
      body:
          todoProvider.todos.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    HomeSearch(),
                    SizedBox(height: 24),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: todoProvider.todos.length,
                      itemBuilder: (context, index) {
                        return HomeTodoCard(
                          title: todoProvider.todos[index].title,
                          subtitle:
                              todoProvider.todos[index].subtitle ?? "Нету",
                          time: todoProvider.todos[index].time,
                          date: todoProvider.todos[index].date,
                          progress: todoProvider.todos[index].progress,
                        );
                      },
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    HomeSearch(),
                    SizedBox(height: 24),
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
              ),
    );
  }
}
