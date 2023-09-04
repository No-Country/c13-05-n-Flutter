import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/activities_view/activities_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../../models/user_models.dart';

class CardsView extends StatefulWidget {
  static const name = 'menu';
  const CardsView({super.key, this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  State<CardsView> createState() => _CardsViewState(user, productList);
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  _CardsViewState(this.user, this.productList);

  final UserModel? user;
  final List<CardModel>? productList;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            height: 210,
            width: double.infinity,
            child: Swiper(
                scale: 1,
                loop: false,
                viewportFraction: 0.9,
                itemCount: productList!.length,
                itemBuilder: ((context, index) {
                  CardModel product = productList![index];

                  return Padding(
                    padding: const EdgeInsets.all(.0),
                    child: CardsActive(
                      cardData: product,
                      owner: user?.name,
                    ),
                  );
                }))),
      ]),
    ));
  }
}
