import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';

class CardsActive extends StatelessWidget {
  CardsActive({super.key, required this.cardData, this.owner});

  dynamic cardData;
  String? owner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          color: Colors.black,
          // margin: const EdgeInsets.all(0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/descarga.jpg',
                fit: BoxFit.cover,
              ),
              // Container(
              //   margin: const EdgeInsets.all(20),
              //   alignment: Alignment.bottomRight,
              //   width: 60,
              //   height: 60,
              //   child: Image.asset('assets/images/chip.jpg'),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(children: [
                    //   const Spacer(),
                    //   Image.asset('assets/images/visa.jpg',
                    //       color: Colors.white,
                    //       fit: BoxFit.cover,
                    //       width: 60,
                    //       height: 30),
                    // ]),
                    const SizedBox(
                      height: 100,
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: IconButton(
                    //       onPressed: () {}, icon: const Icon(Icons.abc)),
                    // ),
                    Text(
                      '${cardData?.productNumber}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "monospace",
                          fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                cardData.productType == "visaCard" ||
                                        cardData.productType == "MasterCard"
                                    ? "EXPIRE"
                                    : "Fecha de apertura",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "monospace",
                                    fontSize: 9)),
                            const SizedBox(height: 5),
                            Text('${cardData?.expirationDate}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "monospace")),
                          ],
                        ),
                        Container(width: 20),
                        cardData.productType == "visaCard" ||
                                cardData.productType == "MasterCard"
                            ? const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("CVV",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "monospace",
                                          fontSize: 9)),
                                  SizedBox(height: 5),
                                  Text("568",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "monospace")),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(owner!,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: "monospace")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
