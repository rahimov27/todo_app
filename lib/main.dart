import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/view/home_view.dart';
import 'package:todo_app/onboarding/on_boarding.dart';
import 'package:todo_app/utils/boarding.dart';
import 'package:todo_app/utils/noti_service.dart';
import 'package:todo_app/home/model/todo.dart';
import 'package:todo_app/utils/theme.dart';
import 'package:todo_app/home/viewmodel/todo_viewmodel.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotiService().initNotification();
  await Hive.initFlutter();
  await initializeDateFormatting("ru", null);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoViewmodel()),
        ChangeNotifierProvider(create: (context) => BoardingProvider()),
      ],
      child: Consumer<BoardingProvider>(
        builder: (context, boardingProvider, _) {
          return MaterialApp(
            locale: const Locale("ru", "RU"),
            supportedLocales: const [Locale('ru', 'RU')],
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: boardingProvider.isFinished ? HomeScreen() : OnBoarding(),
            theme: theme,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
