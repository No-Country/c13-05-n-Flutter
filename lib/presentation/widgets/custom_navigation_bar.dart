import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/settings_view/settingns_view.dart';

import '../views/profile_view/profile_view.dart';
import '../views/views.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.wallet_rounded), label: 'Actividad'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: ProfileView.name),
        BottomNavigationBarItem(
            icon: Icon(Icons.abc), label: SettingsView.name),
      ],
    );
  }
}
