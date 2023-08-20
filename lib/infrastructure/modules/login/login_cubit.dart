import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:multi_bank/infrastructure/helpers/helpers.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([
          state.email,
          state.password,
        ])));
    print('Cubit submit: $state');
  }

  void emailChanged(String value) {
    final userEmail = Email.dirty(value);
    emit(state.copyWith(
        email: userEmail,
        isValid: Formz.validate([userEmail, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, isValid: Formz.validate([password, state.email])));
  }
}
