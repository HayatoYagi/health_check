import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// このファイルは現在使っていない
/// settings_uiパッケージがproviderを使うと上手く動かない（notifyChangesで画面が更新されない）ので、StatefulWidgetで実装した
class SettingsViewModel extends ChangeNotifier {
  final _enableNotificationKey = "enableNotification";
  final _notificationHourKey = "notificationHour";
  final _notificationMinuteKey = "notificationMinute";

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool? _enableNotification;

  bool get enableNotification => _enableNotification ?? false;

  void setEnableNotification(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_enableNotificationKey, value);
    notifyListeners();

    if (value) {
      await _flutterLocalNotificationsPlugin.cancelAll();
      final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
      tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        notificationTime.hour,
        notificationTime.minute,
      );

      await _flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'flutter_local_notifications',
        'message',
        scheduledDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel id',
            'channel name',
            importance: Importance.max,
            priority: Priority.high,
            ongoing: true,
            styleInformation: BigTextStyleInformation('message'),
            icon: 'ic_notification',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      print('set notification');
    }
  }

  TimeOfDay? _notificationTime;

  TimeOfDay get notificationTime =>
      _notificationTime ?? const TimeOfDay(hour: 8, minute: 0);

  void setNotificationTime(TimeOfDay value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_notificationHourKey, value.hour);
    prefs.setInt(_notificationMinuteKey, value.minute);
    notifyListeners();
  }

  void loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _enableNotification = prefs.getBool(_enableNotificationKey) ?? false;
    _notificationTime = TimeOfDay(
      hour: prefs.getInt(_notificationHourKey) ?? 8,
      minute: prefs.getInt(_notificationMinuteKey) ?? 0,
    );
    notifyListeners();

    _configureLocalTimeZone();
    _initNotification();
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  void _initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
