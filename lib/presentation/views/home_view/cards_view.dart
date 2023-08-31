import 'package:flutter/material.dart';
import 'package:multi_bank/models/card_model.dart';
import 'package:multi_bank/presentation/views/activities_view/activities_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../models/user_models.dart';

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
                itemCount: productList!.length,
                itemBuilder: ((context, index) {
                  CardModel product = productList![index];



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
                        cardData: product,
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
