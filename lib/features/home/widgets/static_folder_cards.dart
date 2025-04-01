import 'package:flutter/material.dart';
import 'package:todo_app/features/home/widgets/folder_card.dart';
import 'package:todo_app/utils/app_colors.dart';

class StaticFolderCards extends StatelessWidget {
  const StaticFolderCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
