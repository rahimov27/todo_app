import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

class CircularProgressBar extends StatelessWidget {
  final double percentage;
  const CircularProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percentage),
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 2),
      builder: (context, value, _) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(100, 100),
                painter: _CircularProgressPainter(value),
              ),
              Text(
                "${value.toInt()}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  _CircularProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint =
        Paint()
          ..color = Colors.grey.shade800
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10
          ..strokeCap = StrokeCap.round;

    Paint progressPaint =
        Paint()
          ..color =
              percentage < 40
                  ? AppColors.sliderRed
                  : percentage < 60
                  ? AppColors.cardYellow
                  : percentage < 80
                  ? const Color.fromARGB(255, 104, 227, 76)
                  : AppColors.appGreen
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10
          ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 10;

    canvas.drawCircle(center, radius, backgroundPaint);
    double arcAngle = 2 * 3.141592653589793 * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Начало сверху
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
