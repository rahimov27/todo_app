import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/home/screens/add_folder_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/features/home/widgets/folder_card.dart';
import 'package:todo_app/features/home/widgets/home_search.dart';
import 'package:todo_app/features/home/widgets/home_todo_card.dart';
import 'package:todo_app/features/home/widgets/home_welcome_text.dart';
import 'package:todo_app/viewmodel/todo_viewmodel.dart';

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
                HomeSearch(),
                SizedBox(height: 14),
                provider.todos.isNotEmpty
                    ? ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 200,
                        maxHeight: MediaQuery.of(context).size.width * 0.90,
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final todo = provider.todos[index];
                          return Dismissible(
                            onDismissed: (direction) {
                              Future.delayed(Duration(milliseconds: 100), () {
                                provider.deleteTask(index);
                                setState(() {});
                              });
                            },
                            key: Key(todo.key.toString()),
                            child: HomeTodoCard(
                              title: todo.title,
                              subtitle: todo.subtitle ?? "Ничего не добавлено",
                              time: todo.time,
                              date: todo.date,
                              progress: todo.progress,
                            ),
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
                          progress: 35,
                        ),
                      ],
                    ),

                // folders part
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      "Папки",
                      style: TextStyle(
                        letterSpacing: -0.7,
                        fontFamily: "Inter-Bold",
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            FolderCard(
                              width: MediaQuery.of(context).size.width / 2.10,
                              height: MediaQuery.of(context).size.width / 1.3,
                              title: "Задачи по работе и заводу",
                              subtitle: "Заполнение всех документов на заводе!",
                              progress: 30,
                              color: AppColors.appPurple,
                            ),
                            SizedBox(height: 10),
                            FolderCard(
                              width: MediaQuery.of(context).size.width / 2.10,
                              height: MediaQuery.of(context).size.width / 2.5,
                              title: "Задачи по дому",
                              subtitle: "",
                              progress: 60,
                              color: AppColors.pink,
                            ),
                          ],
                        ),

                        Spacer(),

                        Column(
                          children: [
                            FolderCard(
                              width: MediaQuery.of(context).size.width / 2.50,
                              height: MediaQuery.of(context).size.width / 1.7,
                              title: "Задачи по курсам",
                              subtitle: "Заполнение всех документов на заводе!",
                              progress: 20,
                              color: AppColors.cardBlue,
                            ),
                            SizedBox(height: 10),
                            FolderCard(
                              width: MediaQuery.of(context).size.width / 2.50,
                              height: MediaQuery.of(context).size.width / 1.7,
                              title: "Задачи по учебе",
                              subtitle: "Заполнение всех документов на заводе!",
                              progress: 80,
                              color: AppColors.appGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FolderCard(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 2.5,
                      title: "Задачи по курсам",
                      subtitle: "",
                      progress: 20,
                      color: AppColors.cardYellow,
                    ),
                    SizedBox(height: 30),
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
              shape: CircleBorder(),
              child: SvgPicture.asset(
                width: 22,
                "assets/svg/folder.svg",
                // ignore: deprecated_member_use
                color: AppColors.cardBlue,
              ),
            ),
            SpeedDialChild(
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
