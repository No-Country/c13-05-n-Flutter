import 'package:flutter/material.dart';
import 'package:multi_bank/models/activities_model.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import 'cards_view.dart';

class MainView extends StatelessWidget {
  static const name = 'main';
  const MainView({super.key, this.userEmail, this.user, this.activities});
  final UserModel? user;
  final String? userEmail;
  final ActivitiesModel? activities;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
          actions: [
            ElevatedButton(
                onPressed: () {
                  AppRepository().singOut(context);
                },
                child: const Text("Logout")),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardsView(user: user),
              Container(
                height: height * 0.06,
                width: width * 0.95,
                decoration: BoxDecoration(
                  color: const Color(0xFF113CB1),
                  borderRadius: BorderRadius.circular(
                      8), // Ajusta el valor según tus preferencias
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text('+ Asociar un nuevo producto',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Roboto')),
                ),
              ),
              MenuView(user: user),
              // ActivitiesView(user?.products, activities),
              // ElevatedButton(
              //     onPressed: () {
              //       AppRepository().singOut(context);
              //     },
              //     child: const Text("Logout")),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}
