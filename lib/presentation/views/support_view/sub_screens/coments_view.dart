import 'package:flutter/material.dart';

class ComentsView extends StatelessWidget {
  static const name = 'personal-info';
  const ComentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comentarios y sugerencias"),
      ),
      body: const Center(
        child: Text("Datos Personales"),
      ),
    );
  }
}
