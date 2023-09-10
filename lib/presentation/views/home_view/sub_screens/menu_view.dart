import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';

import '../../../../models/card_model.dart';
import '../../../../repositories/app_repository.dart';

class MenuView extends StatefulWidget {
  static const name = 'menu';
  const MenuView({super.key, this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;
  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final containerWidth = width / 5;

    final List<MenuData> menuItems = [
      const MenuData(
          buttonName: 'Recarga\n Celular',
          icono: Icons.phone,
          alertMessage:
              'Proximamente podras recargar tu celular por este medio.'
          // route: PersonalInfoView(),
          ),
      const MenuData(
          buttonName: 'Pagar\n cuentas',
          icono: Icons.credit_card_outlined,
          // route: SettingsView(),
          alertMessage: 'Esta función estará disponible próximamente.'),
      MenuData(
        buttonName: 'Transferencia\n de dinero ',
        icono: Icons.send,
        route: TransferenceView(
            user: widget.user, productList: widget.productList),
        alertMessage: '',
      ),
      MenuData(
          buttonName: 'Pedir\n dinero',
          icono: Icons.monetization_on_outlined,
          route: ProfileView(user: widget.user),
          alertMessage: ''),
      MenuData(
          buttonName: 'Historial\n financiero',
          icono: Icons.bar_chart_rounded,
          route: TransferenceView(
              user: widget.user, productList: widget.productList),
          alertMessage: ''),
    ];

    return SizedBox(
        height: 120,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            separatorBuilder: (context, index) {
              // Agregar un espacio entre los elementos
              return SizedBox(width: 5); // Ajusta el ancho según tu preferencia
            },
            itemBuilder: (context, index) {
              final menuItem = menuItems[index];
              return CustomMenu(
                containerWidth: containerWidth,
                buttonName: menuItem.buttonName,
                icono: menuItem.icono,
                route: menuItem.route,
                alertMessage: menuItem.alertMessage,
              );
            },
          ),
        ));
  }
}

class MenuData {
  const MenuData({
    this.containerWidth,
    this.route,
    required this.buttonName,
    required this.icono,
    required this.alertMessage,
  });

  final double? containerWidth;
  final route;
  final String buttonName;
  final IconData icono;
  final String alertMessage;
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
    required this.containerWidth,
    this.route,
    required this.buttonName,
    required this.icono,
    required this.alertMessage,
  });

  final double containerWidth;
  final route;
  final String buttonName;
  final IconData icono;
  final String alertMessage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            const BeveledRectangleBorder()),
      ),
      onPressed: route != null
          ? () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => route,
                ),
              );
            }
          : () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Próximamente'),
                    content: Text(alertMessage),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Color de la sombra
                  spreadRadius: 1, // Extensión de la sombra
                  blurRadius: 3, // Difuminación de la sombra
                  offset: const Offset(0, 3), // Desplazamiento de la sombra
                ),
              ],
            ),
            padding: const EdgeInsets.all(5),
            child: Icon(
              icono,
              color: const Color.fromARGB(137, 0, 0, 0),
              size: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            buttonName,
            textAlign: TextAlign.center,
            textScaleFactor: 0.75,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
