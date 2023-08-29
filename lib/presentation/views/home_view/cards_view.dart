import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/activities_view/activities_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
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
  int currentIndex = 0;

  _CardsViewState(this.user);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).colorScheme;
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            // height: 250,
            // width: width,
            // child: PageView.builder(
            //     controller: PageController(initialPage: 0),
            //     onPageChanged: (value) {
            //       currentIndex = value;
            //       setState(() {});
            //     },
            //     padEnds: false,
            //     pageSnapping: false,
            //     physics: const BouncingScrollPhysics(),
            height: 210,
            width: double.infinity,
            child: Swiper(
                scale: 0.9,
                viewportFraction: 0.9,
                // autoplay: true,
                // pagination: SwiperPagination(
                //     margin: const EdgeInsets.only(top: 0),
                //     builder: DotSwiperPaginationBuilder(
                //         activeColor: colors.primary,
                //         color: colors.secondary,
                //         space: 2.0)),
                itemCount: user!.products.length,
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

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: DecoratedBox(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       boxShadow: const [
                    //         BoxShadow(
                    //           color: Colors.black87,
                    //           blurRadius: 5,
                    //           offset: Offset(2, 5),
                    //         )
                    //       ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CardsActive(
                        cardData: cardData(),
                        owner: user?.name,
                      ),
                    ),
                    // ),
                  );
                }))),
      ]),
    ));
  }
}
