import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/features/home/widgets/circular_progress_bar.dart';

class HomeTodoCard extends StatelessWidget {
  final String title, subtitle;
  final DateTime time, date;
  final double progress;
  final double? percentage;
  const HomeTodoCard({
    super.key,
    this.percentage,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            maxLines: 2,
                            title,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "Montserrat-semibold",
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset("assets/svg/tabler_clock.svg"),
                            SizedBox(width: 4),
                            Text(
                              DateFormat("HH:mm").format(time),
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
                              DateFormat("yy MMMM", "ru").format(date),
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
                    CircularProgressBar(percentage: progress),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
