import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/views.dart';

import '../../views/home_view/sub_screens/home_tab_view.dart';
import '../../views/home_view/sub_screens/general_activities_view.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  static const List<Widget> mainTabs = [
    HomeTabView(),
    GeneralActivitiesView(),
  ];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff8F0000),
      currentIndex: currentIndex,
      onTap: onItemTapped,
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
