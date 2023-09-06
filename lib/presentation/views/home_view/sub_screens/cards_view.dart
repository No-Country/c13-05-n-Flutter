import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/activities_view/activities_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../../models/user_models.dart';
import '../../../widgets/navigation_button/navigation_button.dart';
import '../../transference_view/sub_screens/amount_input_view.dart';

class CardsView extends StatefulWidget {
  static const name = 'menu';
  const CardsView(
      {super.key, this.user, this.productList, this.tabFromPayment});
  final UserModel? user;
  final List<CardModel>? productList;
  final bool? tabFromPayment;

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CardModel singleProduct;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 210,
              width: double.infinity,
              child: Swiper(
                scale: 1,
                loop: false,
                viewportFraction: 0.9,
                itemCount: widget.productList!.length,
                itemBuilder: ((context, index) {
                  CardModel product = widget.productList![index];

                  return Padding(
                    padding: const EdgeInsets.all(.0),
                    child: CardsActive(
                      cardData: product,
                      owner: widget.user?.name,
                      tabFromPayment: widget.tabFromPayment,
                      function: () {
                        setState(() {
                          singleProduct = product;
                        });
                        print(product);
                      },
                    ),
                  );
                }),
              ),
            ),
            if (widget.tabFromPayment!)
              Column(
                children: [
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: NavigationButton.navigationButton(const AmountInputView(), context),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

typedef PrintFunction = Function();
