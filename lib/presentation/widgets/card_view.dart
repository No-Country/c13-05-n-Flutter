import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: SizedBox(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Colors.black,
            margin: const EdgeInsets.all(0),
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
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                      const Text(
                        '4111-xxxx-xxxx-1445',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "monospace",
                            fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("EXPIRE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "monospace",
                                      fontSize: 9)),
                              SizedBox(height: 5),
                              Text("11/29",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "monospace")),
                            ],
                          ),
                          Container(width: 20),
                          const Column(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text("mi nombre",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "monospace")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
