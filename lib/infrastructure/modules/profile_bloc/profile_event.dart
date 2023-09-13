part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileFirstRunningEvent extends ProfileEvent {
  final UserModel? user;
  const ProfileFirstRunningEvent(this.user);
}

class ProfileUpdateEvent extends ProfileEvent {
  final String? userId;
  final dynamic object;
  const ProfileUpdateEvent(this.userId, this.object);
}
