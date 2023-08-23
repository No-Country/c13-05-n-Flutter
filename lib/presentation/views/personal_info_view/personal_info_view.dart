import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos Personales"),
      ),
      body: const Center(
        child: Text("Datos Personales"),
      ),
    );
  }
}
