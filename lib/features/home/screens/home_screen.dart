import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/home/screens/add_folder_screen.dart';
import 'package:todo_app/features/todoFolder/viewmodel/todo_folder_viewmodel.dart';
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
    final folderProvider = Provider.of<TodoFolderViewmodel>(context);
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
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: folderProvider.folderModels.length,
                        itemBuilder: (context, index) {
                          return FolderCard(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width / 2.5,
                            title: folderProvider.folderModels[index].title,
                            subtitle:
                                folderProvider.folderModels[index].subtitle,
                            progress:
                                folderProvider.folderModels[index].porgress,
                            color:
                                folderProvider
                                    .folderModels[index]
                                    .backgroundColor,
                          );
                        },
                      ),
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
                  () => showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.60,
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 70,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffA9A9A9),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Название папки",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Montserrat-semibold",
                                        color: Colors.white,
                                        letterSpacing: -0.7,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    TextField(
                                      controller:
                                          folderProvider.titleController,
                                      decoration: InputDecoration(
                                        hintText: "Название папки",
                                        filled: true,
                                        fillColor: Color(0xff4A4A4A),
                                        hintStyle: TextStyle(
                                          fontFamily: "Montserrat",
                                          letterSpacing: -0.7,
                                          fontSize: 16,
                                          color: Color(0xffA5A5A5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 22),
                                    Text(
                                      "Описание папки",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Montserrat-semibold",
                                        color: Colors.white,
                                        letterSpacing: -0.7,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      height: 150,
                                      child: TextField(
                                        controller:
                                            folderProvider.subtitleController,
                                        expands: true,
                                        maxLines: null,
                                        minLines: null,
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        decoration: InputDecoration(
                                          hintText: "Название папки",
                                          filled: true,
                                          fillColor: Color(0xff4A4A4A),
                                          hintStyle: TextStyle(
                                            fontFamily: "Montserrat",
                                            letterSpacing: -0.7,
                                            fontSize: 16,
                                            color: Color(0xffA5A5A5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 22),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SelectColorWidget(
                                          color: AppColors.appPurple,
                                        ),
                                        SelectColorWidget(
                                          color: AppColors.cardBlue,
                                        ),
                                        SelectColorWidget(
                                          color: AppColors.cardYellow,
                                        ),
                                        SelectColorWidget(
                                          color: AppColors.appGreen,
                                        ),
                                        SelectColorWidget(
                                          color: AppColors.pink,
                                        ),
                                        SelectColorWidget(
                                          color: AppColors.sliderRed,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22),
                                    // buttons part
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                overlayColor:
                                                    WidgetStateProperty.all(
                                                      Colors.transparent,
                                                    ),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Color(0xffEF0004),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                      AppColors.scaffoldColor,
                                                    ),
                                              ),
                                              child: Text(
                                                "Отменить",
                                                style: TextStyle(
                                                  letterSpacing: -0.5,
                                                  fontFamily: "Inter-Medium",
                                                  fontSize: 16,
                                                  color: Color(0xffEF0004),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                folderProvider.addFolder();
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              style: ButtonStyle(
                                                overlayColor:
                                                    WidgetStateProperty.all(
                                                      Colors.transparent,
                                                    ),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Color(0xff004CFF),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                      Color(0xff004CFF),
                                                    ),
                                              ),
                                              child: Text(
                                                "Создать",
                                                style: TextStyle(
                                                  fontFamily: "Inter-Medium",
                                                  fontSize: 16,
                                                  letterSpacing: -0.5,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              shape: CircleBorder(),
              child: SvgPicture.asset(
                width: 22,
                "assets/svg/folder.svg",
                // ignore: deprecated_member_use
                color: AppColors.cardBlue,
              ),
            ),
            SpeedDialChild(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFolderScreen()),
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

class SelectColorWidget extends StatelessWidget {
  final Color color;
  const SelectColorWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final folderProvider = context.watch<TodoFolderViewmodel>();

    bool isSelected = folderProvider.folderColorDefault == color;
    return GestureDetector(
      onTap: () {
        folderProvider.selectColor(color);
      },
      child: CircleAvatar(radius: isSelected ? 16 : 20, backgroundColor: color),
    );
  }
}
