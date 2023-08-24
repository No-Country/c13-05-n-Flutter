import 'package:flutter/material.dart';

import '../../widgets/cards/cards_active.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const CardsActive(),
    );
  }
}
