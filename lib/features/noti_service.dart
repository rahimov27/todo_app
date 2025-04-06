import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // ИНИЦИАЛИЗАЦИЯ
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingAndroid = AndroidInitializationSettings(
      'mipmap/ic_launcher',
    );

    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingsIOS,
    );

    await notificationPlugin.initialize(initSettings);

    // ОБЯЗАТЕЛЬНО установить как инициализированный
    _isInitialized = true;
  }

  // НАСТРОЙКИ УВЕДОМЛЕНИЯ
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', // ID канала
        'Daily Notifications', // Имя канала
        channelDescription: 'Daily Notification channel',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentSound: true,
        presentBadge: true,
      ),
    );
  }

  // ПОКАЗАТЬ УВЕДОМЛЕНИЕ
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationPlugin.show(
      id,
      title,
      body,
      notificationDetails(), // ❗️ Используем правильные настройки
    );
  }
}
