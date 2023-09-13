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
        final email = registerCubit.state.email;
        final password = registerCubit.state.password;

        final TextEditingController nameController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController addressController = TextEditingController();
        final TextEditingController phoneController = TextEditingController();
        final String nameText = nameController.text;
        final String emailText = emailController.text;
        final String addressText = addressController.text;
        final String phoneText = phoneController.text;

        final color = Theme.of(context).colorScheme;
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  Form(
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
                          // onChanged: (value) {
                          //   setState(() {
                          //     nameController.text = value;
                          //   });
                          // },
                          errorMessage: username.errorMessage,
                        ),
                        const SizedBox(height: 10),
                        const Text('Correo electronico',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        CustomTextFormField(
                          // label: 'Correo electrónico',
                          controller: emailController,
                          hint: ' ejemplo@mail.com',
                          icon: Icons.mail_rounded,
                          // onChanged: registerCubit.emailChanged,
                          errorMessage: email.errorMessage,
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
                        // PasswordTextFormField(
                        //   // label: 'Contraseña:',
                        //   hint: 'ingresa tu contraseña',
                        //   onChanged: registerCubit.passwordChanged,
                        //   errorMessage: password.errorMessage,
                        // ),
                        const SizedBox(height: 20),
                        Container(
                            height: height * 0.06,
                            width: width * 0.95,
                            decoration: BoxDecoration(
                              color: registerCubit.state.password.isValid
                                  ? color.primary
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  try {
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(ProfileUpdateEvent(
                                      widget.user?.id,
                                      {
                                        'name': nameController.value.text,
                                        'email':
                                            emailController.value.text.isEmpty
                                                ? widget.user?.email
                                                : emailController.value.text,
                                        'address':
                                            addressController.value.text.isEmpty
                                                ? widget.user?.address
                                                : addressController.value.text,
                                        'phone':
                                            phoneController.value.text.isEmpty
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
                                            title:
                                                const Text('Actualizar perfil'),
                                            content: const Text(
                                                'Los cambios se veran reflejados en tu proximo acceso.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
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
                                child: Text("Continuar"))
                            // MaterialButton(
                            //   onPressed:
                            //       // registerCubit.state.password.isValid ==
                            //       //         false
                            //       //     ? null
                            //       //     :
                            //       () {
                            //     try {
                            //       // if (validatePassword(password.value) &&
                            //       //     password.value.length >= 6) {
                            //       BlocProvider.of<ProfileBloc>(context)
                            //           .add(ProfileUpdateEvent(
                            //         state.user?.id,
                            //         {
                            //           'name': nameText,
                            //           'email': emailText,
                            //           'address': addressText.isEmpty
                            //               ? user?.email
                            //               : addressText,
                            //           'phone': int.parse(phoneText)
                            //         },
                            //       ));
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) {
                            //           return AlertDialog(
                            //             title: const Text('Actualizar perfil'),
                            //             content: const Text(
                            //                 'Los cambios se veran reflejados en menos de 24horas.'),
                            //             actions: <Widget>[
                            //               TextButton(
                            //                 onPressed: () {
                            //                   Navigator.of(context).pop();
                            //                   Navigator.of(context).pop();
                            //                 },
                            //                 child: const Text('Cerrar'),
                            //               ),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //       // }
                            //     } catch (e) {
                            //       debugPrint('Error: $e');
                            //     }
                            //   },
                            //   child: const Text('Confirmar',
                            //       style: TextStyle(
                            //           fontSize: 18,
                            //           color: Colors.white,
                            //           fontFamily: 'Roboto')),
                            // ),
                            )
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

// class _RegisterForm extends StatelessWidget {
//   const _RegisterForm(this.user);
//   final UserModel? user;
//
//   @override
//   Widget build(BuildContext context) {
//     final registerCubit = context.watch<RegisterCubit>();
//     final username = registerCubit.state.username;
//     final email = registerCubit.state.email;
//     final password = registerCubit.state.password;
//
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController addressController = TextEditingController();
//     final TextEditingController phoneController = TextEditingController();
//     final String nameText = nameController.text;
//     final String emailText = emailController.text;
//     final String addressText = addressController.text;
//     final String phoneText = phoneController.text;
//
//     final color = Theme.of(context).colorScheme;
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Form(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//           const Text('Nombre y Apellido',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           CustomTextFormField(
//             // label: 'Nombre y Apellido',
//             controller: nameController,
//             hint: 'ingresa tu nombre y completo',
//             icon: Icons.person,
//             onChanged: registerCubit.usernameChanged,
//             errorMessage: username.errorMessage,
//           ),
//           const SizedBox(height: 10),
//           const Text('Correo electronico',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           CustomTextFormField(
//             // label: 'Correo electrónico',
//             controller: emailController,
//             hint: ' ejemplo@mail.com',
//             icon: Icons.mail_rounded,
//             onChanged: registerCubit.emailChanged,
//             errorMessage: email.errorMessage,
//           ),
//           const SizedBox(height: 10),
//           const Text('Domicilio',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           CustomTextFormField(
//             // label: 'Correo electrónico',
//             controller: addressController,
//             hint: 'Ingresa tu domicilio',
//             icon: Icons.add_home_rounded,
//           ),
//           const SizedBox(height: 10),
//           const Text('Telefono',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           CustomTextFormField(
//             // label: 'Correo electrónico',
//             controller: phoneController,
//             hint: 'Ingresa tu telefono',
//             icon: Icons.add_call,
//             isPhone: true,
//           ),
//           const SizedBox(height: 10),
//           const Text('Contraseña',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           PasswordTextFormField(
//             // label: 'Contraseña:',
//             hint: 'ingresa tu contraseña',
//             onChanged: registerCubit.passwordChanged,
//             errorMessage: password.errorMessage,
//           ),
//           const SizedBox(height: 20),
//           Container(
//             height: height * 0.06,
//             width: width * 0.95,
//             decoration: BoxDecoration(
//               color: registerCubit.state.password.isValid
//                   ? color.primary
//                   : Colors.grey,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: MaterialButton(
//               onPressed: registerCubit.state.password.isValid == false
//                   ? null
//                   : () {
//                       try {
//                         if (validatePassword(password.value) &&
//                             password.value.length >= 6) {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text('Actualizar perfil'),
//                                 content: const Text(
//                                     'Los cambios se veran reflejados en menos de 24horas.'),
//                                 actions: <Widget>[
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text('Cerrar'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         }
//                       } catch (e) {
//                         debugPrint('Error: $e');
//                       }
//                     },
//               child: const Text('Confirmar',
//                   style: TextStyle(
//                       fontSize: 18, color: Colors.white, fontFamily: 'Roboto')),
//             ),
//           )
//         ]));
//   }
// }
