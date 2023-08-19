import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_bank/repositories/app_repository.dart';

import '../../../models/user_model.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  UserModel? user;

  MainBloc(this.user) : super(MainState(user)) {
    on<LogOutEvent>(_onLogOutEvent);
  }

  void _onLogOutEvent(LogOutEvent event, Emitter<MainState> emit) async {
    FireBaseServices(event.user).singOut(event.context);
  }
}
