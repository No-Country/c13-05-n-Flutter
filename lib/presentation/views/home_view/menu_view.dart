import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  static const name = 'menu';
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final color = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
        child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            height: 150,
            width: width,
            child: PageView.builder(
                controller: PageController(initialPage: 3),
                padEnds: false,
                pageSnapping: false,
                physics: const BouncingScrollPhysics(),
                itemCount: color.length,
                itemBuilder: ((context, index) {
                  print(index % color.length);
                  return Container(
                    margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // shape: BoxShape.circle,
                      color: color[index],
                    ),
                    child: const Text('active'),
                  );
                }))),
      ]),
    ));
  }
}
