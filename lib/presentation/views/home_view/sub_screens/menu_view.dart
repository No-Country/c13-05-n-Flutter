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
    final containerWidth = width / 3;

    final List<MenuData> menuItems = [
      const MenuData(
        buttonName: 'Recarga\n Celular',
        icono: Icons.phone,
        route: PersonalInfoView(),
      ),
      const MenuData(
        buttonName: 'Pagar\n cuentas',
        icono: Icons.credit_card_outlined,
        route: SettingsView(),
      ),
      const MenuData(
        buttonName: 'Transferencia\n de dinero ',
        icono: Icons.send,
        route: SettingsView(),
      ),
      MenuData(
        buttonName: 'Pedir\n dinero',
        icono: Icons.monetization_on_outlined,
        route: ProfileView(user: widget.user),
      ),
      MenuData(
        buttonName: 'Historial\n financiero',
        icono: Icons.bar_chart_rounded,
        route: TransferenceView(user: widget.user, productList: widget.productList),
      ),
    ];

    return SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final menuItem = menuItems[index];
              return CustomMenu(
                containerWidth: containerWidth,
                buttonName: menuItem.buttonName,
                icono: menuItem.icono,
                route: menuItem.route,
              );
            },
          ),
        ));
  }
}

class MenuData {
  const MenuData({
    this.containerWidth,
    required this.route,
    required this.buttonName,
    required this.icono,
  });

  final double? containerWidth;
  final route;
  final String buttonName;
  final IconData icono;
}

class CustomMenu extends StatelessWidget {
  const CustomMenu({
    super.key,
    required this.containerWidth,
    required this.route,
    required this.buttonName,
    required this.icono,
  });

  final double containerWidth;
  final route;
  final String buttonName;
  final IconData icono;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            const BeveledRectangleBorder()),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => route,
          ),
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
