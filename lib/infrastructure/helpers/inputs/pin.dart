import 'package:formz/formz.dart';

// Define input validation errors
enum PinError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Pin extends FormzInput<String, PinError> {
  // Call super.pure to represent an unmodified form input.
  const Pin.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Pin.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PinError.empty) return 'El campo es requerido';
    if (displayError == PinError.length) return 'Ingresa cuatro numeros';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PinError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PinError.empty;
    if (value.length == 4) return PinError.length;

    return null;
  }
}
