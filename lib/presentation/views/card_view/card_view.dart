import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';

class CardView extends StatelessWidget {
  CardView({super.key, required this.card});
  CardModel card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      // body:  CardsActive(),
    );
  }
}
