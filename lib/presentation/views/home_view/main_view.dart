import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import 'cards_view.dart';

class MainView extends StatelessWidget {
  static const name = 'main';
  const MainView({super.key, this.userEmail, this.user});
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
                ),
              ));
            },
            child: Text("Hola, ${user?.name}"),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardsView(user: user),
              MenuView(user: user),
              const Placeholder(fallbackHeight: 150),
              ElevatedButton(
                  onPressed: () {
                    AppRepository().singOut(context);
                  },
                  child: const Text("Logout")),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}
