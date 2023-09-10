import 'package:flutter/material.dart';

import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/add_product_view/add_product_view.dart';
import 'package:multi_bank/presentation/views/views.dart';

import 'package:multi_bank/models/card_model.dart';

import 'cards_view.dart';

class HomeTabView extends StatelessWidget {
  static const name = 'main';
  const HomeTabView({super.key, this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: const Icon(Icons.person_outline_outlined,
                  color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileView(
                    user: user!,
                  ),
                ));
              },
            ),
          ),
          backgroundColor: color.primary,
          title: Text(user?.name != null ? "Hola, ${user?.name}" : 'Bienvenido',
              style: const TextStyle(color: Colors.white)),
          // ),
          centerTitle: false,
        ),
        body: SafeArea(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(children: [
              Container(
                width: width,
                height: height * 0.15,
                color: color.primary,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
                  child: Text("Mis tarjetas",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: productList == null
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Card.png',
                            fit: BoxFit.contain,
                            scale: 0.5,
                          ),
                          const Text(
                            'No hay informacion para mostrar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    : CardsView(
                        user: user,
                        productList: productList,
                        tabFromPayment: false,
                      ),
              ),
            ]),
            productList == null
                ? const Text('no tienes productos aun')
                : const SizedBox(
                    height: 5,
                  ),
            Container(
              height: height * 0.06,
              width: width * 0.95,
              decoration: BoxDecoration(
                color: color.secondary,
                borderRadius: BorderRadius.circular(
                    8), // Ajusta el valor según tus preferencias
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddProductView(),
                    ),
                  );
                },
                child: const Text('+ Asociar un nuevo producto',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Roboto')),
              ),
            ),
            MenuView(
              user: user,
              productList: productList,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                child: Text(
                  'Actividad reciente',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (productList != null)
                        ...?productList?.expand((card) {
                          // Ordenar las actividades por fecha antes de mapearlas

                          final limitedActivities = card.activities.take(4);

                          return limitedActivities.map((activity) {
                            return _CardType1(
                              elevation: 0,
                              label: activity['transaction_type'],
                              paymentName: activity['amount'],
                              date: activity['payment_date'],
                              entidad: activity['payment_name'],
                            );
                          }).toList();
                        }).toList()
                          ?..sort((a, b) {
                            // Ordenar la lista de widgets de mayor a menor por la fecha de pago (payment_date)
                            String dateA = (a.date);
                            String dateB = (b.date);

                            return dateB.compareTo(dateA);
                          })
                      else
                        const _CardType1(
                          elevation: 0,
                          label: 'Necesitas productos para operar',
                          paymentName: '',
                          date: '',
                          entidad: '',
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        )));
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  final String paymentName;
  final String date;
  final String entidad;

  const _CardType1({
    required this.label,
    required this.elevation,
    required this.paymentName,
    required this.date,
    required this.entidad,
  });
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shadowColor: Colors.black.withOpacity(0.2),
      //  blurRadius: 8,
      //  offset: const Offset(3, 3),

      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      borderOnForeground: false,
      elevation: elevation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.threeLine,
              leading: const Icon(Icons.wallet_sharp),
              title: Text(label),
              subtitle: Text(
                entidad,
                textScaleFactor: 0.8,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(paymentName),
              ),
              subtitle: Align(
                alignment: Alignment.centerRight,
                child: Text(date),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
