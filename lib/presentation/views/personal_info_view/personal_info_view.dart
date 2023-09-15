import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/cubit/register_cubit.dart';
import 'package:multi_bank/infrastructure/modules/profile_bloc/profile_bloc.dart';
import 'package:multi_bank/presentation/widgets/inputs/general_button.dart';
import 'package:multi_bank/presentation/widgets/modals/alert.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';

import '../../../models/user_models.dart';
import '../profile_view/profile_view.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key, required this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Actualiza tu perfil'),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<RegisterCubit>(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(),
            ),
          ],
          child: _RegisterView(user),
        ));
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView(this.user);
  final UserModel? user;

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final registerCubit = context.watch<RegisterCubit>();
        final username = registerCubit.state.username;
        final _formKey = GlobalKey<FormState>();

        final TextEditingController nameController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController addressController = TextEditingController();
        final TextEditingController phoneController = TextEditingController();

        final color = Theme.of(context).colorScheme;
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        return SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                children: [
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
                  Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nombre y Apellido',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            CustomTextFormField(
                              // label: 'Nombre y Apellido',
                              controller: nameController,
                              hint: 'ingresa tu nombre y completo',
                              icon: Icons.person,
                            ),
                            const SizedBox(height: 10),
                            const Text('Domicilio',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            CustomTextFormField(
                              // label: 'Correo electrónico',
                              controller: addressController,
                              hint: 'Ingresa tu domicilio',
                              icon: Icons.add_home_rounded,
                            ),
                            const SizedBox(height: 10),
                            const Text('Telefono',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            CustomTextFormField(
                              // label: 'Correo electrónico',
                              controller: phoneController,
                              hint: 'Ingresa tu telefono',
                              icon: Icons.add_call,
                              isPhone: true,
                            ),
                            const SizedBox(height: 10),
                            const Text('Contraseña',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(height: 20),
                            Container(
                                height: height * 0.06,
                                width: width * 0.95,
                                decoration: BoxDecoration(
                                  color: color.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: MaterialButton(
                                    onPressed: () {
                                      try {
                                        BlocProvider.of<ProfileBloc>(context)
                                            .add(ProfileUpdateEvent(
                                          widget.user?.id,
                                          {
                                            'name': nameController.value.text,
                                            'email': emailController
                                                    .value.text.isEmpty
                                                ? widget.user?.email
                                                : emailController.value.text,
                                            'address': addressController
                                                    .value.text.isEmpty
                                                ? widget.user?.address
                                                : addressController.value.text,
                                            'phone': phoneController
                                                    .value.text.isEmpty
                                                ? widget.user?.phone
                                                : int.parse(
                                                    phoneController.value.text)
                                          },
                                        ));
                                        nameController.clear();
                                        emailController.clear();
                                        phoneController.clear();
                                        addressController.clear();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Actualizar perfil'),
                                                content: const Text(
                                                    'Los cambios se veran reflejados en tu proximo acceso.'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cerrar'),
                                                  ),
                                                ],
                                              );
                                            });
                                      } catch (err) {
                                        print(err);
                                      }
                                    },
                                    child: const Text(
                                      "Continuar",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'Roboto'),
                                    )))
                          ])),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
