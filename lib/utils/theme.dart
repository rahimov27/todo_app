import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.scaffoldColor,
    surfaceTintColor: Colors.transparent,
    toolbarHeight: 0,
  ),
);
