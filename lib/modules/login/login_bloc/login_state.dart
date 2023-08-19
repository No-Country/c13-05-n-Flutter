part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UserModel? user;

  const LoginState({required this.user});

  @override
  List<Object> get props => [];
  LoginState copyWith({required UserModel user}) {
    return LoginState(user: user);
  }
}
