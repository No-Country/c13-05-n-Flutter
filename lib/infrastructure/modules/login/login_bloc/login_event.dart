part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginFirstRunningEvent extends LoginEvent {
  final dynamic context;
  final UserModel? user;
  const LoginFirstRunningEvent(this.context, this.user);
}

class Login extends LoginEvent {
  final UserModel? user;
  final bool savedSession;
  final String email;
  final String password;
  final BuildContext context;
  const Login(
      this.user, this.savedSession, this.email, this.password, this.context);
}
