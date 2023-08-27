part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UserModel? user;
  final bool loggedIn;

  const LoginState({required this.user, required this.loggedIn});

  @override
  List<Object> get props => [];
  LoginState copyWith({required UserModel? user, required bool loggedIn}) {
    return LoginState(user: user, loggedIn: loggedIn);
  }
}
