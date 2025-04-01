import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/utils/app_colors.dart';

class FolderCard extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String subtitle;
  final int progress;
  final Color color;
  const FolderCard({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/svg/design-line.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "Montserrat-semibold",
                          fontSize: 18,
                          letterSpacing: -0.5,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12,
                          height: 1,
                          color: AppColors.cardGrey,
                        ),
                      ),
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Container(
                            width: progress * 1.4,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromARGB(30, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Прогресс",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                height: 1,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Text(
                              "$progress%",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                letterSpacing: -0.7,
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
