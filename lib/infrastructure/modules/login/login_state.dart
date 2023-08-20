part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class LoginFormState extends Equatable {
  final Email email;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  LoginFormState copyWith({
    final Email? email,
    final Password? password,
    final FormStatus? formStatus,
    bool? isValid,
  }) =>
      LoginFormState(
          email: email ?? this.email,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid);

  @override
  List<Object> get props => [formStatus, password, email];
}
