import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  static const name = 'settings';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuracion"),
      ),
      body: const Center(
        child: Text("Conficuracion"),
      ),
    );
  }
}
