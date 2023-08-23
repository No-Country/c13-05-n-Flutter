import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/presentation/views/login_view/login_view.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterLogo(size: 150),
                      Text(
                          'Bienvenido!\n Ingresa los datos para crear una nueca cuenta',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700)),
                      Text('ingresa tu mail y password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200)),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  label: 'Email:',
                  hint: 'Ingresa un email',
                  onChanged: loginCubit.emailChanged,
                  errorMessage: email.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordTextFormField(
                  label: 'Password:',
                  hint: 'Ingresa tu password',
                  onChanged: loginCubit.passwordChanged,
                  errorMessage: password.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: loginCubit.state.isValid == false
                      ? null
                      : () {
                          try {
                            FireBaseServices().createUserWithEmailPassword(
                              email: email.value,
                              password: password.value,
                            );
                          } catch (e) {
                            debugPrint('Error: $e');
                          }
                        },
                  child: const Text("Singup"),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginView()));
                    },
                    child: const Text(
                        "Ya tienes una cuenta? Click aqui para login"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}