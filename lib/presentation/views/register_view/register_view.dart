import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/cubit/register_cubit.dart';
import 'package:multi_bank/presentation/widgets/inputs/general_button.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    final pin = registerCubit.state.pin;
    final color = Theme.of(context).colorScheme;

    return Form(
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
            hint: 'ingresa tu nombre y completo',
            icon: Icons.person,
            onChanged: registerCubit.usernameChanged,
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
            hint: ' ejemplo@mail.com',
            icon: Icons.mail_rounded,
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10),
          const Text('Contraseña',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
          PasswordTextFormField(
            // label: 'Contraseña:',
            hint: 'ingresa tu contraseña',
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 20),
          const Text('PIN',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
          PasswordTextFormField(
            // label: 'PIN:',
            hint: 'Genera tu PIN de 4 digitos',
            onChanged: registerCubit.pinChanged,
            errorMessage: pin.errorMessage,
          ),
          const SizedBox(height: 20),
          SingupButton(
            registerCubit: registerCubit,
            user: username,
            email: email,
            password: password,
            pin: pin,
            messageButton: 'Registrarse',
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 28 / 12,
                color: Colors.black, // Color de texto predeterminado
              ),
              children: [
                const TextSpan(
                  text: "Al registrarte aceptas nuestros ",
                ),
                TextSpan(
                  text: "Términos && Condiciones ",
                  style: TextStyle(
                    color: color
                        .primary, // Color diferente para términos y condiciones
                  ),
                ),
                const TextSpan(
                  text: "y nuestra ",
                ),
                TextSpan(
                  text: "Política de Privacidad.* ",
                  style: TextStyle(
                    color: color
                        .primary, // Color diferente para política de privacidad
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
