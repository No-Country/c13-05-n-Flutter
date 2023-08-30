import 'package:formz/formz.dart';

// Define input validation errors
enum AgeError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Age extends FormzInput<String, AgeError> {
  // Call super.pure to represent an unmodified form input.
  const Age.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Age.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AgeError.empty) return 'El campo es requerido';
    if (displayError == AgeError.length)
      return 'Tienes que ser mayor de edad para registrarte';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  AgeError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return AgeError.empty;
    // if () return AgeError.length;

    return null;
  }
}
