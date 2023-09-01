import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';

import '../../views/activities_view/activities_view.dart';

class CardsActive extends StatefulWidget {
  CardsActive({super.key, required this.cardData, this.owner});

  CardModel cardData;
  String? owner;

  @override
  State<CardsActive> createState() => _CardsActiveState();
}

class _CardsActiveState extends State<CardsActive> {
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ActivitiesView(widget.cardData?.activities, widget.cardData)))
        },
        child: Card(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(fit: StackFit.expand, children: [
            Image.asset(
              'assets/images/Card.png',
              fit: BoxFit.contain,
              scale: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showBalance = !showBalance;
                        });
                      },
                      child: Row(
                        children: [
                          const Text("Saldo:"),
                          const SizedBox(width: 10),
                          Text(showBalance
                              ? '\$ ${widget.cardData?.balance}'
                              : 'X X X X'),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            showBalance
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    insertDashesInNumber(widget.cardData!.productNumber),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "monospace",
                        fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              widget.cardData.productType == "visaCard" ||
                                      widget.cardData.productType ==
                                          "MasterCard"
                                  ? "EXPIRE"
                                  : "Fecha de apertura",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "monospace",
                                  fontSize: 9)),
                          const SizedBox(height: 5),
                          Text('${widget.cardData?.expirationDate}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "monospace")),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

String insertDashesInNumber(int number) {
  final numberStr = number.toString();
  final List<String> groups = [];
  for (int i = 0; i < numberStr.length; i += 4) {
    final end = i + 4;
    groups.add(numberStr.substring(
        i, end > numberStr.length ? numberStr.length : end));
  }
  final maskedGroups = List.generate(groups.length - 1, (_) => 'xxxx');
  maskedGroups.add(groups.last);

  return maskedGroups.join('-');
}
