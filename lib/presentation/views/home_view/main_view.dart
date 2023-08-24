import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import 'cards_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.userEmail, this.user});
  final UserModel? user;
  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileView(
                        user: user!,
                      )));
            },
            child: Text("Hola, ${user?.name}"),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CardsView(),
              // const Text("Main page"),
              const MenuView(),
              const Placeholder(fallbackHeight: 200),
              ElevatedButton(
                  onPressed: () {
                    AppRepository().singOut(context);
                  },
                  child: const Text("Logout")),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar()
        // BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: 0,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.wallet_rounded), label: 'Actividad'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.supervised_user_circle_rounded),
        //         label: 'Perfil'),
        //     BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Balances'),
        //   ],
        // ),
        );
  }
}
