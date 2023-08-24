class UserModel {
  final String id;
  final String name;
  final int age;
  final String email;
  final String address;
  final int secretPin;
  final int phone;
  final String type;
  final bool profileStatus;
  final List<dynamic> products;

  UserModel(this.id, this.name, this.age, this.email, this.address,
      this.secretPin, this.phone, this.type, this.profileStatus, this.products);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['name'],
      json['age'],
      json['email'],
      json['address'],
      json['secretPin'],
      json['phone'],
      json['type'],
      json['profileStatus'],
      json['products'] ?? [],
    );
  }
}
