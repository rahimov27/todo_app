import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        cursorColor: AppColors.textFieldText,
        style: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset("assets/svg/search.svg"),
          ),
          hintText: "Поиск задачи",
          hintStyle: TextStyle(
            letterSpacing: -0.5,
            fontFamily: "Montserrat",
            color: AppColors.textFieldText,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: AppColors.textField,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
