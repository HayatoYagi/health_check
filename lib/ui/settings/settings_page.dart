import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:health_check/ui/edit_profile/edit_profile_page.dart';
import 'package:health_check/ui/launch/launch_page.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => SettingsViewModel()..loadSettings(),
//       child: const _SettingsPage(),
//     );
//   }
// }
//
// class _SettingsPage extends StatelessWidget {
//   const _SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("設定"),
//       ),
//       body: SettingsList(
//         sections: [
//           SettingsSection(
//             title: const Text("通知設定"),
//             tiles: [
//               SettingsTile.switchTile(
//                 initialValue:
//                     // context.read<SettingsViewModel>().enableNotification,
//                     context.select((SettingsViewModel viewModel) => viewModel.enableNotification),
//                 onToggle: (value) {
//                   context.read<SettingsViewModel>().setEnableNotification(value);
//                 },
//                 title: const Text("通知オン"),
//               ),
//               SettingsTile(
//                 title: const Text("通知時刻"),
//                 trailing: Text(
//                   context.select((SettingsViewModel viewModel) =>
//                       viewModel.notificationTime.toString()),
//                 ),
//                 onPressed: (BuildContext context) async {
//                   TimeOfDay? notificationTime = await showTimePicker(
//                     context: context,
//                     initialTime:
//                         context.read<SettingsViewModel>().notificationTime,
//                   );
//                   if (notificationTime != null) {
//                     context
//                         .read<SettingsViewModel>()
//                         .setNotificationTime(notificationTime);
//                   }
//                 },
//               ),
//             ],
//           ),
//           SettingsSection(
//             title: const Text("アカウント設定"),
//             tiles: [
//               SettingsTile.navigation(
//                 title: const Text("登録情報変更"),
//                 onPressed: (BuildContext context) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const SettingsPage()),
//                   );
//                 },
//               ),
//               SettingsTile.navigation(
//                 leading: const Icon(Icons.logout),
//                 title: const Text("ログアウト"),
//                 onPressed: (BuildContext context) {
//                   // todo
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  final _enableNotificationKey = "enableNotification";
  final _notificationHourKey = "notificationHour";
  final _notificationMinuteKey = "notificationMinute";

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _settingsLoaded = false;
  bool _enableNotification = false;
  TimeOfDay _notificationTime = const TimeOfDay(hour: 8, minute: 0);

  void _setEnableNotification(bool value) async {
    setState(() {
      _enableNotification = value;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_enableNotificationKey, value);

    _setNotification();
  }

  void _setNotificationTime(TimeOfDay value) async {
    setState(() {
      _notificationTime = value;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_notificationHourKey, value.hour);
    prefs.setInt(_notificationMinuteKey, value.minute);
    _setNotification();
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
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
        AndroidInitializationSettings('icon512');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // todo: アプリをキルすると通知が来ないっぽい？
  Future<void> _setNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();

    if (!_enableNotification) return;

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      _notificationTime.hour,
      _notificationTime.minute,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Health Check',
      '健康観察フォームを提出してください',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminder',
          'リマインダー',
          importance: Importance.max,
          priority: Priority.high,
          // styleInformation: BigTextStyleInformation('健康観察フォームを提出してください'),
          // icon: 'icon512',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _enableNotification = prefs.getBool(_enableNotificationKey) ?? false;
      _notificationTime = TimeOfDay(
        hour: prefs.getInt(_notificationHourKey) ?? 8,
        minute: prefs.getInt(_notificationMinuteKey) ?? 0,
      );

      _settingsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: _settingsLoaded
          ? SettingsList(
              sections: [
                SettingsSection(
                  title: const Text("通知設定"),
                  tiles: [
                    SettingsTile.switchTile(
                      initialValue: _enableNotification,
                      onToggle: _setEnableNotification,
                      title: const Text("通知オン"),
                    ),
                    SettingsTile(
                      title: const Text("通知時刻"),
                      trailing: Text(
                          '${_notificationTime.hour.toString().padLeft(2, '0')}:${_notificationTime.minute.toString().padLeft(2, '0')}'),
                      onPressed: (BuildContext context) async {
                        TimeOfDay? value = await showTimePicker(
                          context: context,
                          initialTime: _notificationTime,
                        );
                        if (value != null) {
                          _setNotificationTime(value);
                        }
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text("アカウント設定"),
                  tiles: [
                    SettingsTile.navigation(
                      title: const Text("登録情報変更"),
                      onPressed: (BuildContext context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()),
                        );
                      },
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.logout),
                      title: const Text("ログアウト"),
                      onPressed: (BuildContext context) {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LaunchPage()));
                      },
                    ),
                  ],
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
