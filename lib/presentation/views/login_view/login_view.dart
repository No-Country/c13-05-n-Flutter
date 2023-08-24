import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_bank/apis/api_rest.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/email.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/password.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/widgets/inputs/general_button.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../signup_view/signup_vie.dart';

class LoginView extends StatelessWidget {
  static const name = 'login';
  const LoginView({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Builder(builder: (context) => _buildView(context)),
    );
  }

  Widget _buildView(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final password = loginCubit.state.password;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingMessage(
                  message: 'Iniciar sesión!',
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  label: 'Email:',
                  hint: 'ejemplo@mail.com',
                  onChanged: loginCubit.emailChanged,
                  errorMessage: email.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordTextFormField(
                  label: 'Password:',
                  hint: 'Ingresa tu contraseña',
                  onChanged: loginCubit.passwordChanged,
                  errorMessage: password.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginBottom(
                  loginCubit: loginCubit,
                  user: user,
                  email: email,
                  password: password,
                  messageButton: 'Iniciar',
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupView(user: user)));
                    },
                    child: const Text(
                        "No tienes cuenta? Click aca para crear una"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class HeadingMessage extends StatelessWidget {
  final String message;
  const HeadingMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(message,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),

        // Text('Bienvenido!',
        //     style: TextStyle(
        //         fontSize: 35, fontWeight: FontWeight.w700)),
        // Text('ingresa tu mail y password',
        //     style: TextStyle(
        //         fontSize: 20, fontWeight: FontWeight.w200)),
      ],
    ));
  }
}
