class AccountModel {
  final String productName;
  final int balance;
  final bool status;
  final String productType;
  final int productNumber;
  final String openDate;

  AccountModel(
    this.productName,
    this.balance,
    this.status,
    this.productType,
    this.productNumber,
    this.openDate,
  );

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      json['productName'],
      json['balance'],
      json['status'],
      json['productType'],
      json['productNumber'],
      json['openDate'],
    );
  }
}
