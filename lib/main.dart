import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/theme.dart';
import 'package:todo_app/view/category_screen.dart';
import 'package:todo_app/view/folder_screen.dart';
import 'package:todo_app/view/profile_screen.dart';
import 'package:todo_app/view/home_screen.dart';
import 'package:todo_app/viewmodel/todo_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());

  // Display only up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoViewmodel(),
      child: MaterialApp(
        home: const MainMenu(),
        theme: theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PersistentTabController _persistentTabController;

  @override
  void initState() {
    super.initState();
    _persistentTabController = PersistentTabController(initialIndex: 0);
  }

  // Список экранов
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      const FolderScreen(),
      const CategoryScreen(),
      const ProfileScreen(),
    ];
  }

  // Иконки нижнего меню
  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/svg/home.svg", width: 24, height: 24),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/svg/folder.svg", width: 24, height: 24),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svg/category.svg",
          width: 24,
          height: 24,
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/svg/profile.svg", width: 24, height: 24),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarItems(),
      backgroundColor: AppColors.bottomNavBar,
      controller: _persistentTabController,
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      animationSettings: NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        ),
      ),
      stateManagement: true,
      navBarHeight: 70,
      hideNavigationBarWhenKeyboardAppears: true,
      navBarStyle: NavBarStyle.style3,
    );
  }
}
