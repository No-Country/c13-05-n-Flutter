import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';
import 'package:multi_bank/infrastructure/helpers/helpers.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/pin.dart';
import 'package:multi_bank/infrastructure/helpers/inputs/user_full_name.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Name.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        pin: Pin.dirty(state.pin.value),
        isValid: Formz.validate([
          state.username,
          state.password,
          state.email,
          state.pin,
        ])));

    print('Cubit Submit: $state');
  }

  void usernameChanged(String value) {
    final username = Name.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate(
            [username, state.password, state.email, state.pin])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate(
            [email, state.password, state.username, state.pin])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate(
            [password, state.username, state.email, state.pin])));
  }

  void pinChanged(String value) {
    final pin = Pin.dirty(value);
    emit(state.copyWith(
        pin: pin,
        isValid: Formz.validate(
            [pin, state.password, state.username, state.email])));
  }
}
