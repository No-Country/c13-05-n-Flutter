import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bank/infrastructure/helpers/helpers.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/pin.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/user_full_name.dart';
import 'package:multi_bank/infrastructure/modules/cubit/register_cubit.dart';
import 'package:multi_bank/infrastructure/modules/login/login_bloc/login_bloc.dart';
import 'package:multi_bank/infrastructure/modules/login/login_cubit.dart';
import 'package:multi_bank/models/user_models.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../modals/alert.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({
    super.key,
    required this.savedSession,
    required this.loginCubit,
    required this.user,
    required this.email,
    required this.password,
    required this.messageButton,
  });

  final bool savedSession;
  final LoginCubit loginCubit;
  final UserModel? user;
  final Email email;
  final Password password;
  final String messageButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(user),
      child: Builder(builder: (context) => _buildView(context)),
    );
  }

  Widget _buildView(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.06,
      width: width * 0.95,
      decoration: BoxDecoration(
        color: loginCubit.state.isValid ? const Color(0xFF113CB1) : Colors.grey,
        borderRadius:
            BorderRadius.circular(8), // Ajusta el valor según tus preferencias
      ),
      child: MaterialButton(
        onPressed: loginCubit.state.isValid == false
            ? null
            : () {
                try {
                  if (validatePassword(password.value) &&
                      password.value.length >= 6) {
                    BlocProvider.of<LoginBloc>(context).add(Login(user,
                        savedSession, email.value, password.value, context));
                  } else {
                    Alert.runAlert(
                        "Por favor introduzca una contraseña que "
                        "incluya mayuscula 'A,B' .. "
                        "y algun caracter especial '@,-...'",
                        context);
                  }
                } catch (e) {
                  debugPrint('Error: $e');
                }
              },
        child: Text(messageButton,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontFamily: 'Roboto')),
      ),
    );
  }
}

class SingupButton extends StatelessWidget {
  const SingupButton({
    super.key,
    required this.registerCubit,
    required this.user,
    required this.email,
    required this.password,
    required this.messageButton,
    required this.pin,
  });

  final RegisterCubit registerCubit;
  final Name? user;
  final Email email;
  final Password password;
  final Pin pin;
  final String messageButton;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.06,
      width: width * 0.95,
      decoration: BoxDecoration(
        color:
            registerCubit.state.isValid ? const Color(0xFF113CB1) : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: registerCubit.state.isValid == false
            ? null
            : () {
                try {
                  if (validatePassword(password.value) &&
                      password.value.length >= 6) {
                    AppRepository().createUserWithEmailPassword(
                      email: email.value,
                      password: password.value,
                    );
                  } else {
                    Alert.runAlert(
                        "Por favor introduzca una contraseña que "
                        "incluya mayuscula 'A,B' .. "
                        "y algun caracter especial '@,-...'",
                        context);
                  }
                } catch (e) {
                  debugPrint('Error: $e');
                }
              },
        child: Text(messageButton,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontFamily: 'Roboto')),
      ),
    );
  }
}

// regular expression to check if string
RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
//A function that validate user entered password
bool validatePassword(String pass) {
  String password = pass.trim();
  if (pass_valid.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}
