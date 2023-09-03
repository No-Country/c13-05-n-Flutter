import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length, format, number, esp }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  static final RegExp specialChatRegExp =
      RegExp(r'/^(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])');
  static final RegExp capitalLetterRegExp = RegExp(r'(?=.*[A-Z])');
  static final RegExp numberRegExp = RegExp(r'(?=.*\d)');

  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.length) return 'Minimo 6 letras';
    if (displayError == PasswordError.format)
      return 'La contraseña debe contener al menos una letra mayúscula';
    if (displayError == PasswordError.number)
      return 'La contraseña debe contener al menos un número';
    if (displayError == PasswordError.esp)
      return 'La contraseña debe contener al menos un carácter especial';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    if (!RegExp(r'[A-Z]').hasMatch(value)) return PasswordError.format;
    if (!RegExp(r'[0-9]').hasMatch(value)) return PasswordError.number;
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value))
      return PasswordError.esp;

    return null;
  }
}
