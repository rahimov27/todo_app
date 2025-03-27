import 'package:flutter/material.dart';
import 'package:todo_app/view/home_widgets/home_search.dart';
import 'package:todo_app/view/home_widgets/home_todo_card.dart';
import 'package:todo_app/view/home_widgets/home_welcome_text.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeWelcomeText(),
              SizedBox(height: 14),
              HomeSearch(),
              SizedBox(height: 20),
              HomeTodoCard(),
              SizedBox(height: 14),
              HomeTodoCard(percentage: 10),
            ],
          ),
        ),
      ),
    );
  }
}
