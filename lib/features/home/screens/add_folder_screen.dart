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
                                              mode:
                                                  CupertinoDatePickerMode.time,
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
                                              mode:
                                                  CupertinoDatePickerMode.date,
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
                                    SvgPicture.asset(
                                      "assets/svg/date-time.svg",
                                    ),
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
                            label: _currentSliderValue.truncate().toString(),
                            divisions: 5,
                            thumbColor:
                                _currentSliderValue < 40
                                    ? AppColors.sliderRed
                                    : _currentSliderValue < 80
                                    ? AppColors.cardYellow
                                    : AppColors.appGreen,
                            activeColor:
                                _currentSliderValue < 40
                                    ? AppColors.sliderRed
                                    : _currentSliderValue < 80
                                    ? AppColors.cardYellow
                                    : AppColors.appGreen,
                            value: _currentSliderValue,
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            },
                            max: 100,
                          ),
                        ),
                        SizedBox(width: 10),

                        Text(
                          "${_currentSliderValue.truncate().toString()}%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Inter-Medium",
                          ),
                        ),
                      ],
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

  double _currentSliderValue = 20;
}
