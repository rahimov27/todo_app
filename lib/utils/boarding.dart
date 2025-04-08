import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingProvider extends ChangeNotifier {
  bool _isFinished = false;

  bool get isFinished => _isFinished;

  BoardingProvider() {
    boardingStatus(); // вызываем при создании
  }

  Future<void> boardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isFinished = prefs.getBool("boarding") ?? false;
    notifyListeners();
  }

  Future<void> completeBoarding() async {
    _isFinished = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("boarding", true);
    notifyListeners();
  }
}
