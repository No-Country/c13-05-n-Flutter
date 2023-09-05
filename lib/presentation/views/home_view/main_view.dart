import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/general_activities_view.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/home_tab_view.dart';

import '../../../models/activities_model.dart';
import '../../../models/card_model.dart';
import '../../../models/user_models.dart';
import '../profile_view/profile_view.dart';
import '../settings_view/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView(
      {super.key,
      this.user,
      this.productList,
      this.allActivities,
      this.cardActivity});

  final UserModel? user;
  final List<CardModel>? productList;
  final List<ActivitiesModel>? allActivities;
  final List<GeneralActivitiesView>? cardActivity;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> mainTabs = [
      HomeTabView(
        user: widget.user,
        productList: widget.productList,
        cardActivity: widget.cardActivity,
      ),
      ProfileView(user: widget.user),
      GeneralActivitiesView(
        allActivities: widget.allActivities,
      ),
      const SettingsView()
    ];

    return Scaffold(
      body: mainTabs.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: const Color(0xff8F0000),
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_rounded,
            ),
            label: 'Billetera',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up_outlined,
            ),
            label: 'Actividad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Mas',
          ),
        ],
      ),
    );
  }
}
