part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginFirstRunningEvent extends LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  const Login(this.email, this.password, this.context);
}
