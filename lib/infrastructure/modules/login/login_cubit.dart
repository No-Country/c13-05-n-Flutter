import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginFormState> {
  LoginBloc() : super(const LoginFormState()) {
    void onSubmit(String value) {
      print('Submit');
    }

    void emailChanged(String value) {
      emit(state.copyWith(email: value));
    }

    void passwordChanged(String value) {
      emit(state.copyWith(password: value));
    }
  }
}
