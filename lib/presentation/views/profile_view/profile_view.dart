import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../../../models/card_model.dart';
import '../home_view/sub_screens/home_tab_view.dart';

class ProfileView extends StatelessWidget {
  static const name = 'perfil';
  const ProfileView({super.key, required this.user, this.productList});
  final UserModel? user;
  final List<CardModel>? productList;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Mi perfil"),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                AppRepository().singOut(context);
              },
              icon: const Icon(Icons.exit_to_app_rounded),
            )
          ]),
      body: Center(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Expanded(
                    child: Image.network(
                      "https://picsum.photos/200",
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user!.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                user!.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "+${user!.phone}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: width / 1.5,
                height: 48,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 40,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Configuración",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                    ),
                  ],
                ),
                // ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PersonalInfoView(
                        user: user,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: width / 1.5,
                  height: 48,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        size: 40,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Datos personales",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsView(),
                    ),
                  );
                },
                child: SizedBox(
                  width: width / 1.5,
                  height: 48,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        size: 40,
                      ),
                      Spacer(),
                      Text(
                        "Ayuda",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 150),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
