part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Name username;
  final Email email;
  final Password password;
  final Pin pin;
  final Age age;
  final Address address;
  final Phone phone;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.pin = const Pin.pure(),
    this.age = const Age.pure(),
    this.address = const Address.pure(),
    this.phone = const Phone.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Name? username,
    Email? email,
    Password? password,
    Pin? pin,
    Age? age,
    Address? address,
    Phone? phone,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        age: age ?? this.age,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        pin: pin ?? this.pin,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        username,
        age,
        address,
        phone,
        email,
        password,
        pin
      ];
}
