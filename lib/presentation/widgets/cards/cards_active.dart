import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/home_view/sub_screens/cards_view.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../../views/activities_view/activities_view.dart';

class CardsActive extends StatefulWidget {
  CardsActive(
      {super.key,
      required this.cardData,
      this.owner,
      this.tabFromPayment,
      this.function,
      this.tabFromPaymentInput});

  CardModel? cardData;
  String? owner;
  bool? tabFromPayment;
  bool? tabFromPaymentInput;
  PrintFunction? function;

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
          if (widget.tabFromPayment == true ||
              widget.tabFromPaymentInput == true)
            {
              widget.function!(),
            }
          else
            {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ActivitiesView(
                      widget.cardData?.activities, widget.cardData),
                ),
              ),
            }
        },
        child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assets/images/Card.png',
            fit: BoxFit.contain,
            scale: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    child: Image.asset(
                      'assets/images/Visa.png',
                      fit: BoxFit.contain,
                      scale: 1,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(autoWidth(142, context))),
                  ),
                  onPressed: () {
                    setState(() {
                      showBalance = !showBalance;
                    });
                  },
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(height: 18),
                          Text("Saldo :",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 19,
                                color: Colors.black,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                              showBalance
                                  ? '\$ ${widget.cardData?.balance}'
                                  : 'X X X X'),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            color: const Color.fromRGBO(33, 33, 33, 1),
                            showBalance
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  insertDashesInNumber(widget.cardData!.productNumber),
                  style: const TextStyle(fontFamily: "monospace", fontSize: 20),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            widget.cardData?.productType == "visaCard" ||
                                    widget.cardData?.productType == "MasterCard"
                                ? "EXPIRE"
                                : "Fecha de apertura",
                            style: const TextStyle(
                                fontFamily: "monospace", fontSize: 9)),
                        const SizedBox(height: 5),
                        Text('${widget.cardData?.expirationDate}',
                            style: const TextStyle(fontFamily: "monospace")),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
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
