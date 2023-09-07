import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/views/support_view/sub_screens/chat_suport_view.dart';
import 'package:multi_bank/presentation/views/support_view/sub_screens/coments_view.dart';

class SettingsView extends StatelessWidget {
  static const name = 'settings';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Centro de asistencia"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "¿En qué podemos ayudarte?",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                height: 20 / 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            height: height * 0.06,
            width: width * 0.95,
            decoration: BoxDecoration(
              color: color.primary,
              borderRadius: BorderRadius.circular(
                  8), // Ajusta el valor según tus preferencias
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatsView(),
                  ),
                );
              },
              child: const Text('Chatea con nosotros',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Roboto')),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: height * 0.06,
            width: width * 0.95,
            decoration: BoxDecoration(
              border: Border.all(
                color: color.primary,
                width: 2.0,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  8), // Ajusta el valor según tus preferencias
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ComentsView(),
                  ),
                );
              },
              child: const Text('Dejanos un comentario',
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto')),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Si preferís llamarnos o escribirnos: ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_outlined,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "+ 549 11 456 0976",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 12 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "contacto@nocountrywallet.com",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 12 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "Avenida de Mayo 657, CABA, Argentina",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 12 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
