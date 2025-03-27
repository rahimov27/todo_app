import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/view/home_widgets/home_search.dart';
import 'package:todo_app/view/home_widgets/home_todo_card.dart';
import 'package:todo_app/view/home_widgets/home_welcome_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarOpacity: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldColor,
        toolbarHeight: 0,
      ),
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
              SizedBox(height: 20),
              HomeTodoCard(),
              SizedBox(height: 14),
              HomeTodoCard(percentage: 10),

              // folders part
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
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment(1, 1.03),
        child: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class FolderCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String subtitle;
  final int progress;
  final Color color;
  const FolderCard({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                "assets/svg/design-line.svg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Montserrat-semibold",
                      fontSize: 18,
                      letterSpacing: -0.5,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      height: 1,
                      color: AppColors.cardGrey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Container(
                        width: progress * 1.4,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(30, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Прогресс",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            height: 1,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          "$progress%",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            letterSpacing: -0.7,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
