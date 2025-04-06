import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/utils/app_colors.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  final List<OnboardingContent> onBoardingData = [
    OnboardingContent(
      title: "Организуйте свой день",
      subtitle:
          "Создавайте списки задач, устанавливайте приоритеты и управляйте временем с удобным планировщиком.",
      animation: "assets/animations/animation-2.json",
    ),
    OnboardingContent(
      title: "Напоминания и уведомления",
      subtitle:
          "Никогда не забывайте важные дела — включите напоминания и получайте уведомления вовремя.",
      animation: "assets/animations/animation-1.json",
    ),
    OnboardingContent(
      title: "Достигайте целей легко",
      subtitle:
          "Отмечайте выполненные задачи, отслеживайте прогресс и становитесь продуктивнее каждый день.",
      animation: "assets/animations/mzE7jHsdAX.json",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBoarding,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(
                    onBoardingData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: onBoardingData.length,
                  itemBuilder:
                      (context, index) => OnboardingContent(
                        title: onBoardingData[index].title,
                        subtitle: onBoardingData[index].subtitle,
                        animation: onBoardingData[index].animation,
                      ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    "Продолжить",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.onBoardingButton,
                      fontFamily: "Montserrat-semibold",
                    ),
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

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:
            isActive ? Colors.white : const Color.fromARGB(104, 255, 255, 255),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title, subtitle, animation;
  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Lottie.asset(animation),
        Spacer(),
        Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            height: 1,
            fontFamily: "Montserrat-medium",
            fontSize: 24,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 51,
          child: Text(
            textAlign: TextAlign.center,
            subtitle,
            style: TextStyle(
              height: 1.1,
              fontFamily: "Montserrat",
              fontSize: 14,
              letterSpacing: -0.1,
              color: AppColors.onBoardingGray,
            ),
          ),
        ),
        Spacer(),
        SizedBox(height: 67),
      ],
    );
  }
}
