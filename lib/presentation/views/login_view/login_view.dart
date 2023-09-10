import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_bank/infrastructure/modules/login/login_bloc/login_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/presentation/widgets/inputs/general_button.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';

import '../register_view/register_view.dart';

class LoginView extends StatefulWidget {
  static const name = 'login';
  const LoginView({super.key, this.user});
  final UserModel? user;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var savedSession = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit()),
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(widget.user)),
      ],
      child: Builder(builder: (context) => _buildView(context)),
    );
  }

  Widget _buildView(BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(LoginFirstRunningEvent(context, widget.user));

    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final password = loginCubit.state.password;

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
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
                      message: 'Iniciar sesión! ',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text('Correo electronico',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    CustomTextFormField(
                      icon: Icons.mail_rounded,
                      // label: 'Email:',
                      hint: 'ejemplo@mail.com',
                      onChanged: loginCubit.emailChanged,
                      errorMessage: email.errorMessage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Password'),
                    PasswordTextFormField(
                      // label: 'Password:',
                      hint: 'Ingresa tu contraseña',
                      onChanged: loginCubit.passwordChanged,
                      errorMessage: password.errorMessage,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginBottom(
                      savedSession: savedSession,
                      loginCubit: loginCubit,
                      user: widget.user,
                      email: email,
                      password: password,
                      messageButton: 'Iniciar',
                      isLoading: false,
                    ),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: -10, vertical: 0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Recordarme', textAlign: TextAlign.start),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: savedSession,
                      onChanged: (bool? value) {
                        setState(() {
                          savedSession = !savedSession;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No tienes una cuenta? '),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                            },
                            child: const Text("Registrate")),
                      ],
                    )
                  ],
                ),
              ),
            )),
          ),
        );
      },
    );
  }

  Widget check() {
    return Checkbox(
        value: savedSession,
        onChanged: (bool? value) {
          setState(() {
            savedSession = value!;
          });
        });
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
