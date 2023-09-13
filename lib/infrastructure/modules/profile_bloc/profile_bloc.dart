import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multi_bank/apis/api_rest.dart';

import '../../../models/card_model.dart';
import '../../../models/user_models.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserModel? user;
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileFirstRunningEvent>(_onProfileFirstRunning);
    on<ProfileUpdateEvent>(_onProfileUpdate);
  }

  Future<void> _onProfileFirstRunning(
      ProfileFirstRunningEvent event, Emitter<ProfileState> emit) async {
    UserModel? userData = event.user;
    emit(state.copyWith(user: userData));
  }

  Future<void> _onProfileUpdate(
      ProfileUpdateEvent event, Emitter<ProfileState> emit) async {
    String? userId = event.userId;
    ApiCalls().updateProfile(userId!, event.object);
    // emit(state.copyWith(user: userData));
  }
}
