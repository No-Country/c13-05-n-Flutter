part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserModel? user;

  const ProfileState({this.user});

  @override
  List<Object> get props => [];
  ProfileState copyWith({
    required UserModel? user,
  }) {
    return ProfileState(user: user);
  }
}
