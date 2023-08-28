import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/activities_view/activities_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';

import '../../../models/user_models.dart';

class CardsView extends StatefulWidget {
  static const name = 'menu';
  const CardsView({super.key, this.user});
  final UserModel? user;

  @override
  State<CardsView> createState() => _CardsViewState(user);
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  final UserModel? user;
  final color = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  int currentIndex = 0;

  _CardsViewState(this.user);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            height: 250,
            width: width,
            child: PageView.builder(
                controller: PageController(initialPage: 0),
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                padEnds: false,
                pageSnapping: false,
                physics: const BouncingScrollPhysics(),
                itemCount: user?.products.length,
                itemBuilder: ((context, index) {
                  var product = user?.products[index];

                  CardModel cardData() {
                    if (product["product_type"] == "visaCard" ||
                        product["product_type"] == "MasterCard") {
                      return CardModel(
                        product["product_name"],
                        product["balance"],
                        product["status"],
                        product["product_type"],
                        product["product_number"],
                        product["expirationDate"],
                        "",
                        product["activities"],
                      );
                    } else {
                      return CardModel(
                        product["product_name"],
                        product["balance"],
                        product["status"],
                        product["product_type"],
                        product["product_number"],
                        product["openDate"],
                        "",
                        product["activities"],
                      );
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // shape: BoxShape.circle,
                      color: color[index],
                    ),
                    child: CardsActive(
                      cardData: cardData(),
                      owner: user?.name,
                    ),
                  );
                }))),
        TabPageSelector(
          indicatorSize: 6,
          controller: TabController(
            length: color.length,
            vsync: this,
            initialIndex: currentIndex,
          ),
          selectedColor: const Color.fromARGB(255, 63, 157, 205),
          color: Colors.grey,
          borderStyle: BorderStyle.none,
        )
      ]),
    ));
  }
}
