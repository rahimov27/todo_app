import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/view/card_widget.dart';
import 'package:todo_app/viewmodel/todo_viewmodel.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoViewmodel>(context);
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView.builder(
          onReorder:
              (oldIndex, newIndex) => provider.reorderTask(oldIndex, newIndex),
          itemCount: provider.todos.length,
          itemBuilder: (context, index) {
            return Padding(
              key: ValueKey(provider.todos[index]),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TodoCardWidget(
                color: AppColors.purple,
                title: provider.todos[index].title,
                subtitle: provider.todos[index].title,
                date: provider.todos[index].time,
                isDone: provider.todos[index].isDone,
                onChanged: (value) => provider.toggle(value, index),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: "Tektur",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    focusColor: Colors.black,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    hintText: "Введите задачу",
                                    hintStyle: TextStyle(
                                      fontFamily: "Tektur",
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  controller: provider.messageController,
                                  onSubmitted: (value) {
                                    if (provider
                                        .messageController
                                        .text
                                        .isNotEmpty) {
                                      provider.addMessage(
                                        provider.messageController.text,
                                      );
                                      provider.messageController.clear();
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Это важно?",
                                    style: TextStyle(
                                      fontFamily: "Tektur",
                                      fontSize: 14,
                                    ),
                                  ),
                                  CupertinoSwitch(
                                    value: provider.isImportant,
                                    onChanged: (value) {
                                      provider.toggleImportand(value);
                                      setState(() {
                                        // Обновляем состояние через setState
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
