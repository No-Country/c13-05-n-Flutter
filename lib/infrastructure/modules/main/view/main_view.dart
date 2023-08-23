import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/profile_view/profile_view.dart';
import 'package:multi_bank/repositories/app_repository.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Main page"),
          ElevatedButton(
              onPressed: () {
                AppRepository().singOut(context);
              },
              child: const Text("Logout")),
        ],
      )),
    );
  }
}
