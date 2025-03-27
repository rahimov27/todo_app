import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/view/home_widgets/circular_progress_bar.dart';

class HomeTodoCard extends StatelessWidget {
  final double? percentage;
  const HomeTodoCard({super.key, this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.cardColor,
      ),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Защитить дипломку!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Montserrat-semibold",
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/tabler_clock.svg"),
                        SizedBox(width: 4),
                        Text(
                          "10:30 - 13:00",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.timeColor,
                            fontFamily: "Inter",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/date.svg"),
                        SizedBox(width: 4),
                        Text(
                          "24 марта",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.timeColor,
                            fontFamily: "Inter",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appGreen,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        child: Text(
                          "Учеба",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Inter-semibold",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircularProgressBar(percentage: percentage ?? 80),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
