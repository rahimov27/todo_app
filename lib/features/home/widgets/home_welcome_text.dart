import 'package:flutter/material.dart';

class HomeWelcomeText extends StatelessWidget {
  const HomeWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Привет, Сагдий!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            letterSpacing: -0.7,
            fontFamily: "Inter",
          ),
        ),
        Text(
          "Продуктивного вам дня!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: -1,
            fontFamily: "Inter-semibold",
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
