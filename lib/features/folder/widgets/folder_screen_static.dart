import 'package:flutter/material.dart';
import 'package:todo_app/features/home/widgets/folder_card.dart';
import 'package:todo_app/features/home/widgets/home_search.dart';
import 'package:todo_app/utils/app_colors.dart';

class FolderScreenStatic extends StatelessWidget {
  const FolderScreenStatic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearch(),
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
    );
  }
}
