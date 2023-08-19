import 'package:flutter/material.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Main page"),
          ElevatedButton(
              onPressed: () {
                FireBaseServices().singOut(context);
              },
              child: const Text("Logout")),
        ],
      )),
    );
  }
}
