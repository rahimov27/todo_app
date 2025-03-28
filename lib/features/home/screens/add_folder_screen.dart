import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/viewmodel/todo_viewmodel.dart';

class AddFolderScreen extends StatefulWidget {
  const AddFolderScreen({super.key});

  @override
  State<AddFolderScreen> createState() => _AddFolderScreenState();
}

class _AddFolderScreenState extends State<AddFolderScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoViewmodel>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                            child: SvgPicture.asset(
                              "assets/svg/arrow_left.svg",
                            ),
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
                          TextField(
                            controller: provider.titleController,
                            maxLines: 2,
                            cursorColor: AppColors.titleColor,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Inter-semibold",
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: "Мы любим животных и стараемся",
                              hintStyle: TextStyle(
                                fontSize: 22,
                                fontFamily: "Inter-semibold",
                                color: Colors.white,
                                letterSpacing: -0.3,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(),
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
                                              mode:
                                                  CupertinoDatePickerMode.time,
                                              onDateTimeChanged: (time) {
                                                setState(() {
                                                  provider.selectedTime = time;
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
                                      ).format(provider.selectedTime),
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
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              onDateTimeChanged: (date) {
                                                setState(() {
                                                  provider.selectedDate = date;
                                                });
                                              },
                                            ),
                                          ),
                                    ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/svg/date-time.svg",
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      DateFormat(
                                        "dd MMMM",
                                        "ru",
                                      ).format(provider.selectedDate),
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
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Описание",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter-semibold",
                        color: Colors.white,
                        letterSpacing: -0.7,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.transparent,
                      height: 160,
                      child: TextField(
                        controller: provider.subtitleController,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.top,
                        expands: true,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          color: Colors.white,
                        ),
                        cursorColor: AppColors.titleColor,
                        decoration: InputDecoration(
                          hintText: "Введите описание",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: "Inter",
                            color: AppColors.titleColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Под задачи",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter-semibold",
                        color: Colors.white,
                        letterSpacing: -0.7,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.textField,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Заполнить анкету",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter-Medium",
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SvgPicture.asset("assets/svg/checked.svg"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.textField,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Заполнить анкету",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter-Medium",
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SvgPicture.asset("assets/svg/checked.svg"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Цвет фона
                          foregroundColor: Colors.white, // Цвет текста
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ), // Скругление углов
                          ),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Text(
                      "Прогресс",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter-semibold",
                        color: Colors.white,
                        letterSpacing: -0.7,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            padding: EdgeInsets.all(0),
                            label: provider.progress.truncate().toString(),
                            divisions: 5,
                            thumbColor:
                                provider.progress < 40
                                    ? AppColors.sliderRed
                                    : provider.progress < 60
                                    ? AppColors.cardYellow
                                    : provider.progress < 80
                                    ? const Color.fromARGB(255, 104, 227, 76)
                                    : AppColors.appGreen,
                            activeColor:
                                provider.progress < 40
                                    ? AppColors.sliderRed
                                    : provider.progress < 60
                                    ? AppColors.cardYellow
                                    : provider.progress < 80
                                    ? const Color.fromARGB(255, 104, 227, 76)
                                    : AppColors.appGreen,
                            value: provider.progress,
                            onChanged: (double value) {
                              setState(() {
                                provider.progress = value;
                              });
                            },
                            max: 100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${provider.progress.truncate().toString()}%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Inter-Medium",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (provider.titleController.text.isEmpty ||
                              provider.subtitleController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Заполните поля")),
                            );
                          } else {
                            provider.addMessage(
                              provider.titleController.text,
                              provider.subtitleController.text,
                              provider.progress,
                              provider.selectedDate,
                              provider.selectedTime,
                            );
                            provider.titleController.clear();
                            provider.subtitleController.clear();
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Цвет фона
                          foregroundColor: Colors.white, // Цвет текста
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              14,
                            ), // Скругление углов
                          ),
                        ),
                        child: Text(
                          "Добавить задачу",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat-medium",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
