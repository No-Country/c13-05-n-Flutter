import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (value.length < 6) return EmailError.empty;

    return null;
  }
}
