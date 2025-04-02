import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/todoFolder/model/todo_folder_model.dart';
import 'package:todo_app/features/todoFolder/viewmodel/todo_folder_viewmodel.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/theme.dart';
import 'package:todo_app/features/category/category_screen.dart';
import 'package:todo_app/features/folder/folder_screen.dart';
import 'package:todo_app/features/home/screens/home_screen.dart';
import 'package:todo_app/viewmodel/todo_viewmodel.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initializeDateFormatting("ru", null);
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(TodoFolderModelAdapter());

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewmodel()),
        ChangeNotifierProvider(create: (_) => TodoFolderViewmodel()),
      ],
      child: MaterialApp(
        locale: Locale("ru", "RU"),
        supportedLocales: [Locale('ru', 'RU')],
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: MainMenu(),
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
    return [HomeScreen(), const FolderScreen(), const CategoryScreen()];
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
