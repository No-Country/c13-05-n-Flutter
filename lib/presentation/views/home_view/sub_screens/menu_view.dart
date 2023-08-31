import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';

class MenuView extends StatefulWidget {
  static const name = 'menu';
  const MenuView({super.key, this.user});
  final UserModel? user;
  @override
  State<MenuView> createState() => _MenuViewState(user);
}

class _MenuViewState extends State<MenuView> {
  final UserModel? user;
  _MenuViewState(this.user);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final containerWidth = width / 3;

    final List<MenuData> menuItems = [
      const MenuData(
        buttonName: 'Recarga\n Celular',
        icono: Icons.abc,
        route: PersonalInfoView(),
      ),
      const MenuData(
        buttonName: 'Pagar\n cuentas',
        icono: Icons.app_registration_rounded,
        route: SettingsView(),
      ),
      const MenuData(
        buttonName: 'Transferencia\n de dinero ',
        icono: Icons.telegram_rounded,
        route: HelpView(),
      ),
      MenuData(
        buttonName: 'Pedir\n dinero',
        icono: Icons.person_2_rounded,
        route: ProfileView(user: user),
      ),
      const MenuData(
        buttonName: 'Historial\n financiero',
        icono: Icons.telegram_rounded,
        route: HelpView(),
      ),
    ];

    return SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
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
          ),
          // child: GridView(

          //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 5, // Mostrar elementos por fila
          //       mainAxisSpacing: 8, // Espacio vertical entre elementos

          //       childAspectRatio: 1, // tamano del boton
          //     ),
          //     children: [
          //       CustomMenu(
          //         containerWidth: containerWidth,
          //         buttonName: 'Recarga\n Celular',
          //         icono: Icons.abc,
          //         route: const PersonalInfoView(),
          //       ),
          //       CustomMenu(
          //         containerWidth: containerWidth,
          //         buttonName: 'Pagar\n cuentas',
          //         icono: Icons.app_registration_rounded,
          //         route: const SettingsView(),
          //       ),
          //       CustomMenu(
          //         containerWidth: containerWidth,
          //         buttonName: 'Transferencia\n de dinero ',
          //         icono: Icons.telegram_rounded,
          //         route: const HelpView(),
          //       ),
          //       CustomMenu(
          //         containerWidth: containerWidth,
          //         buttonName: 'Pedir\n dinero',
          //         icono: Icons.person_2_rounded,
          //         route: ProfileView(user: user),
          //       ),
          //       CustomMenu(
          //         containerWidth: containerWidth,
          //         buttonName: 'Historial\n financiero',
          //         icono: Icons.telegram_rounded,
          //         route: const HelpView(),
          //       ),
          //     ]),
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
    return SizedBox(
      width: 90,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 210, 227, 235)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              CircleBorder(
                  // borderRadius: BorderRadius.circular(
                  //     10), // Ajusta el valor según tu preferencia
                  ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => route,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icono,
                  size: 30,
                ),
                Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
