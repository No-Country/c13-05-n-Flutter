import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_bank/presentation/widgets/widgets.dart';
import 'package:multi_bank/repositories/app_repository.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(size: 200),
                    CustomTextFormField(
                      label: 'Email',
                      hint: 'Ingresa un email',
                      onChanged: (value) {
                        return email = value;
                      },
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      hint: 'Ingresa tu password',
                      // obscure: true,
                      onChanged: (value) => password = value,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _ButtonValidator(
                        emailController: emailController,
                        passwordController: passwordController),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class _ButtonValidator extends StatelessWidget {
  const _ButtonValidator({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () {
        if (emailController.text.isNotEmpty &&
            passwordController.text.length > 6) {
          try {
            FireBaseServices().singInWithEmailPassword(
                email: emailController.text.trim(),
                password: passwordController.text,
                context: context);
          } catch (e) {
            debugPrint('error is: $e');
          }
        }
      },
      label: const Text("Login"),
      icon: const Icon(Icons.login_outlined),
    );
  }
}
