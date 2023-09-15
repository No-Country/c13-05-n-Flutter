import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/profile_bloc/profile_bloc.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/views/views.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../../../models/card_model.dart';
import '../home_view/sub_screens/home_tab_view.dart';

class ProfileView extends StatelessWidget {
  static const name = 'perfil';
  const ProfileView(
      {super.key, required this.user, this.productList, this.tapFromHome});
  final UserModel? user;
  final List<CardModel>? productList;
  final bool? tapFromHome;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          BlocProvider.of<ProfileBloc>(context)
              .add(ProfileFirstRunningEvent(user));

          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
                automaticallyImplyLeading: tapFromHome == true
                    ? true
                    : tapFromHome == null
                        ? false
                        : false,
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
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset(
                              'assets/images/perfil_mesi.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.user?.name ?? user!.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      state.user?.email ?? user!.email,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "+${state.user?.phone ?? user!.phone}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
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
                              user: state.user,
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
        },
      ),
    );
  }
}
