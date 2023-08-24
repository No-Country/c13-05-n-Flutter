import 'package:flutter/material.dart';

import '../../widgets/cards/cards_active.dart';
import '../../widgets/custom_navigation_bar.dart';

class CardsView extends StatefulWidget {
  static const name = 'menu';
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  final color = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  int currentIndex = 0;
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
                itemCount: color.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // shape: BoxShape.circle,
                      color: color[index],
                    ),
                    child: const CardsActive(),
                  );
                }))),
        TabPageSelector(
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
