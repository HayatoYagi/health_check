import 'package:flutter/material.dart';
import 'package:health_check/ui/form/form_page.dart';
import 'package:health_check/ui/profile_info/profile_info_page.dart';

import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const FormPage(),
    const ProfileInfoPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit_note), label: "フォーム"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "データ"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定"),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
