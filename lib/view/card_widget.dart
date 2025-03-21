import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_colors.dart';

class TodoCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime date;
  final bool isDone;
  final Color color;
  final ValueChanged<bool?> onChanged;
  final bool isImportant;
  const TodoCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isDone,
    required this.onChanged,
    required this.color,
    required this.isImportant,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 170),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isImportant ? AppColors.red : color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: "Tektur",
                          fontSize: 30,
                          color: AppColors.scaffoldColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: "Tektur",
                          fontSize: 16,
                          color: const Color.fromARGB(179, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Checkbox(
                    value: isDone,
                    onChanged: onChanged,
                    side: BorderSide(color: AppColors.scaffoldColor, width: 2),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.scaffoldColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    DateFormat("HH:mm").format(date),
                    style: TextStyle(fontFamily: "Tektur"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
