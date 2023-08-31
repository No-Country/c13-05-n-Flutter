import 'package:flutter/material.dart';

class GeneralActivitiesView extends StatelessWidget {
  const GeneralActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text("Todas las actividades"),
      ),
      body: const Center(
        child: Column(
          children: [Text("Actividades")],
        ),
      ),
    );
  }
}
