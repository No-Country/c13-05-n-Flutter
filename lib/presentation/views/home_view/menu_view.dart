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
    return SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Mostrar tres elementos por fila
                mainAxisSpacing: 10, // Espacio vertical entre elementos
                crossAxisSpacing: 10, // Espacio horizontal entre elementos
                childAspectRatio: 1.5, // tamano del boton
              ),
              children: [
                CustomMenu(
                  containerWidth: containerWidth,
                  buttonName: 'personal info',
                  icono: Icons.abc,
                  route: const PersonalInfoView(),
                ),
                CustomMenu(
                  containerWidth: containerWidth,
                  buttonName: 'Settings',
                  icono: Icons.app_registration_rounded,
                  route: const SettingsView(),
                ),
                CustomMenu(
                  containerWidth: containerWidth,
                  buttonName: 'Ayuda',
                  icono: Icons.telegram_rounded,
                  route: const HelpView(),
                ),
                CustomMenu(
                  containerWidth: containerWidth,
                  buttonName: 'Perfil',
                  icono: Icons.person_2_rounded,
                  route: ProfileView(user: user),
                ),
                //    CustomMenu(
                //   containerWidth: containerWidth,
                //   buttonName: '',
                //   icono:  const Icon(Icons.abc),
                //   route: const PersonalInfoView(),
                // ),
                //    CustomMenu(
                //   containerWidth: containerWidth,
                //   buttonName: '',
                //   icono:  const Icon(Icons.abc),
                //   route: const PersonalInfoView(),
                // ),
              ]
              // },
              ),
        ));
  }
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
      width: containerWidth,
      height: 20,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 210, 227, 235)),
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
            Icon(
              icono,
              size: 30,
            ),
            Text(
              buttonName,
              textAlign: TextAlign.center,
              textScaleFactor: 0.7,
            ),
          ],
        ),
      ),
    );
  }
}
