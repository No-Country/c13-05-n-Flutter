import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  static const name = 'hepl';
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayuda"),
      ),
      body: const Center(
        child: Text("Ayuda"),
      ),
    );
  }
}
