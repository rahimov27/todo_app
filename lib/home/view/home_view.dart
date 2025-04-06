import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/view/add_task_view.dart';
import 'package:todo_app/home/view/todo_details_view.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/home/widgets/home_search.dart';
import 'package:todo_app/home/widgets/home_todo_card.dart';
import 'package:todo_app/home/widgets/home_welcome_text.dart';
import 'package:todo_app/home/viewmodel/todo_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoViewmodel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // todos part
                HomeWelcomeText(),
                SizedBox(height: 14),
                HomeSearch(onChanged: (value) => provider.searchTodos(value)),
                SizedBox(height: 14),
                provider.displayTodos.isNotEmpty
                    ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.displayTodos.reversed.length,
                      itemBuilder: (BuildContext context, int index) {
                        final todo =
                            provider.displayTodos.reversed.toList()[index];
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            Future.delayed(Duration(milliseconds: 100), () {
                              provider.deleteTask(index);
                              setState(() {});
                            });
                          },
                          key: Key(todo.key.toString()),
                          child: GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => TodoDetailsScreen(
                                          index: index,
                                          title: provider.todos[index].title,
                                          subtitle:
                                              provider.todos[index].subtitle ??
                                              "",
                                          time: provider.todos[index].time,
                                          date: provider.todos[index].date,
                                          progress:
                                              provider.todos[index].progress,
                                        ),
                                  ),
                                ),
                            child: HomeTodoCard(
                              title: todo.title,
                              subtitle: todo.subtitle ?? "Ничего не добавлено",
                              time: todo.time,
                              date: todo.date,
                              progress: todo.progress,
                            ),
                          ),
                        );
                      },
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
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.white,
          icon: Icons.add,
          overlayOpacity: 0.4,
          overlayColor: AppColors.scaffoldColor,
          spacing: 10,
          spaceBetweenChildren: 5,
          children: [
            SpeedDialChild(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTaskScreen()),
                  ),
              shape: CircleBorder(),
              child: SvgPicture.asset(
                "assets/svg/task.svg",
                // ignore: deprecated_member_use
                color: AppColors.appGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
