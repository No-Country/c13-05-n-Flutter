import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                      Text('Bienvenido!',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700)),
                      Text('ingresa tu mail y password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200)),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  label: 'Email',
                  hint: 'Ingresa un email',
                  onChanged: loginCubit.emailChanged,
                  errorMessage: email.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordTextFormField(
                  label: 'Password: ${password.value}',
                  hint: 'Ingresa tu password',
                  obscure: true,
                  onChanged: loginCubit.passwordChanged,
                  errorMessage: password.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                // FilledButton.tonalIcon(
                //   onPressed: () {
                //     try {
                //       loginCubit.onSubmit();
                //     } catch (e) {}
                //   },
                //   label: const Text("Login"),
                //   icon: const Icon(Icons.login_outlined),
                // ),
                ElevatedButton(
                    onPressed: loginCubit.state.isValid == false
                        ? null
                        : () {
                            try {
                              FireBaseServices().singInWithEmailPassword(
                                  email: email.value,
                                  password: password.value,
                                  context: context);
                            } catch (e) {
                              debugPrint('error: $e');
                            }
                          },
                    child: const Text("Login"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}

// class _ButtonValidator extends StatelessWidget {
//   const _ButtonValidator({
//     required this.emailController,
//     required this.passwordController,
//   });

//   final TextEditingController emailController;
//   final TextEditingController passwordController;

//   @override
//   Widget build(BuildContext context) {
//     return FilledButton.tonalIcon(
//       onPressed: () {
//         if (emailController.text.isNotEmpty &&
//             passwordController.text.length > 6) {
//           try {
//             FireBaseServices().singInWithEmailPassword(
//                 email: emailController.text.trim(),
//                 password: passwordController.text,
//                 context: context);
//           } catch (e) {
//             debugPrint('error is: $e');
//           }
//         }
//       },
//       label: const Text("Login"),
//       icon: const Icon(Icons.login_outlined),
//     );
//   }
// }
