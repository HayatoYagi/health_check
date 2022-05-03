import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// このファイルは現在使っていない
/// settings_uiパッケージがproviderを使うと上手く動かない（notifyChangesで画面が更新されない）ので、StatefulWidgetで実装した
class SettingsViewModel extends ChangeNotifier {
  final _enableNotificationKey = "enableNotification";
  final _notificationHourKey = "notificationHour";
  final _notificationMinuteKey = "notificationMinute";

  bool? _enableNotification;

  bool get enableNotification => _enableNotification ?? false;

  void setEnableNotification(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_enableNotificationKey, value);
    notifyListeners();
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
  }
}
