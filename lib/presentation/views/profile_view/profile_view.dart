import 'package:flutter/material.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';

class ProfileView extends StatelessWidget {
  static const name = 'perfil';
  const ProfileView({super.key, required this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Mi perfil"),
        backgroundColor: Colors.white,
      ),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsView(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 293,
                  height: 48,
                  child: Row(
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
                      SizedBox(width: 90),
                      Icon(
                        Icons.arrow_forward_ios,
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
                      builder: (context) => const PersonalInfoView(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 293,
                  height: 48,
                  child: Row(
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
                      SizedBox(width: 65),
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
                      builder: (context) => const HelpView(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 293,
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help_outline_outlined,
                        size: 40,
                      ),
                      SizedBox(width: 20),
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
