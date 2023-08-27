import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

import '../../../../models/user_models.dart';
import '../../../../presentation/views/home_view/main_view.dart';
import '../../../../repositories/app_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserModel? user;

  LoginBloc(this.user) : super(LoginState(user: user, loggedIn: false)) {
    on<Login>(_onLogin);
    on<LoginFirstRunningEvent>(_onFirstRunning);
  }

  Future<void> _onLogin(Login event, Emitter<LoginState> emit) async {
    try {
      AppRepository(user: event.user).singInWithEmailPassword(
          savedSession: event.savedSession,
          email: event.email,
          password: event.password,
          context: event.context);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> _onFirstRunning(
      LoginFirstRunningEvent event, Emitter<LoginState> cemit) async {
    final LocalStorage storage = LocalStorage('bank_app.json');
    var loggedUser = await storage.getItem('user');
    bool loggedIn = false;

    if (loggedUser != null) {
      AppRepository(user: event.user).singInWithEmailPassword(
          savedSession: true,
          email: loggedUser["email"],
          password: loggedUser["password"],
          context: event.context);
      emit(state.copyWith(loggedIn: true, user: event.user));
    }
  }
}
