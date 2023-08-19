part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class LoginFormState extends Equatable {
  final String email;
  final String password;
  final FormStatus formStatus;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  LoginFormState copyWith({
    final String? email,
    final String? password,
    final FormStatus? formStatus,
  }) =>
      LoginFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
      );

  @override
  List<Object> get props => [formStatus, password, email];
}
