import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_colors.dart';

class AddFolderScreen extends StatefulWidget {
  const AddFolderScreen({super.key});

  @override
  State<AddFolderScreen> createState() => _AddFolderScreenState();
}

class _AddFolderScreenState extends State<AddFolderScreen> {
  DateTime? selectedTime;
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.appPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: -100,
                  child: SvgPicture.asset("assets/svg/line-left.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset("assets/svg/arrow_left.svg"),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Заголовок",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          color: AppColors.titleColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Мы любим животных и стараемся",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Inter-semibold",
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Дедлайн",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          color: AppColors.titleColor,
                          letterSpacing: -0.3,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:
                                () => showCupertinoModalPopup(
                                  context: context,
                                  builder:
                                      (context) => Container(
                                        color: Colors.white,
                                        height: 200,
                                        child: CupertinoDatePicker(
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.time,
                                          onDateTimeChanged: (time) {
                                            setState(() {
                                              selectedTime = time;
                                            });
                                          },
                                        ),
                                      ),
                                ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/svg/clock.svg"),
                                SizedBox(width: 8),
                                Text(
                                  DateFormat(
                                    "HH:mm",
                                  ).format(selectedTime ?? DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 50),
                          GestureDetector(
                            onTap:
                                () => showCupertinoModalPopup(
                                  context: context,
                                  builder:
                                      (context) => Container(
                                        color: Colors.white,
                                        height: 200,
                                        child: CupertinoDatePicker(
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.date,
                                          onDateTimeChanged: (date) {
                                            setState(() {
                                              selectedDate = date;
                                            });
                                          },
                                        ),
                                      ),
                                ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/svg/date-time.svg"),
                                SizedBox(width: 8),
                                Text(
                                  DateFormat(
                                    "dd MMMM",
                                    "ru",
                                  ).format(selectedDate ?? DateTime.now()),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    color: Colors.white,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}
