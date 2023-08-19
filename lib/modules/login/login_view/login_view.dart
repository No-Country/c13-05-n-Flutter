import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/models/user_model.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../login_bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  late UserModel? user;

  LoginView(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(user),
      child: Builder(builder: (context) => _buildView(context)),
    );
  }

  Widget _buildView(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (_, state) {
        return Scaffold(
          body: Center(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.length > 6) {
                            BlocProvider.of<LoginBloc>(context).add(Login(
                                emailController.text,
                                passwordController.text,
                                context));
                          } else {
                            debugPrint("Email is empty or password is invalid");
                          }
                        },
                        child: const Text("Login"))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
