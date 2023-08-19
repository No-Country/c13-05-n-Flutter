import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multi_bank/models/user_model.dart';

import '../../../repositories/app_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserModel? user;

  LoginBloc(this.user) : super(LoginState(user: user)) {
    on<LoginFirstRunningEvent>(_onFirstRunningEvent);
    on<Login>(_onLogin);
  }

  void _onFirstRunningEvent(
      LoginFirstRunningEvent event, Emitter<LoginState> emit) async {
    // emit(state.copyWith(reactions: event.reaction));
  }

  Future<void> _onLogin(Login event, Emitter<LoginState> emit) async {
    FireBaseServices(state.user).singInWithEmailPassword(
        email: event.email, password: event.password, context: event.context);
  }
}
