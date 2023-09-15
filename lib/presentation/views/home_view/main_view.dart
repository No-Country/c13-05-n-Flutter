import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/general_activities_view.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/home_tab_view.dart';
import 'package:multi_bank/presentation/views/transference_view/transference_view.dart';
import 'package:multi_bank/presentation/widgets/qr_scanner/qr_scaner.dart';

import '../../../models/activities_model.dart';
import '../../../models/card_model.dart';
import '../../../models/user_models.dart';
import '../profile_view/profile_view.dart';
import '../support_view/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, this.user, this.productList, this.allActivities});

  final UserModel? user;
  final List<CardModel>? productList;
  final List<ActivitiesModel>? allActivities;

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
    final color = Theme.of(context).colorScheme;
    final List<Widget> mainTabs = [
      HomeTabView(
        user: widget.user,
        productList: widget.productList,
      ),
      TransferenceView(user: widget.user, productList: widget.productList),
      const QRViewExample(),
      GeneralActivitiesView(
        allActivities: widget.allActivities,
      ),
      ProfileView(user: widget.user),
    ];

    return Scaffold(
      body: mainTabs.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_sharp, size: 25),
            label: 'Transferir',
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.secondary,
                ),
                child: const Icon(
                  Icons.qr_code_rounded,
                  color: Colors.white,
                )),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up_outlined,
            ),
            label: 'Actividad',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
