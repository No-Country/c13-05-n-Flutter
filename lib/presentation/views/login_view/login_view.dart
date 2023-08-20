import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final password = loginCubit.state.password;
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(size: 200),
                CustomTextFormField(
                  label: 'Email',
                  hint: 'Ingresa un email',
                  onChanged: loginCubit.emailChanged,
                  errorMessage: email.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
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
                    onPressed: () {
                      print(email.value);
                      if (email.value.isNotEmpty && password.value.length > 6) {
                        FireBaseServices().singInWithEmailPassword(
                            email: email.value,
                            password: password.value,
                            context: context);
                      } else {
                        debugPrint("Email is empty or password is invalid");
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
