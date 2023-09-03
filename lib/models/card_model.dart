class CardModel {
  final String productId;
  late final String productName;
  final int balance;
  final bool status;
  late final String productType;
  final int productNumber;
  final String expirationDate;
  final List<dynamic> activities;

  CardModel(
    this.productId,
    this.productName,
    this.balance,
    this.status,
    this.productType,
    this.productNumber,
    this.expirationDate,
    this.activities,
  );

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      json['productId'],
      json['productName'],
      json['balance'],
      json['status'],
      json['productType'],
      json['productNumber'],
      json['expirationDate'] ?? "",
      json["activities"] ?? [],
    );
  }
}
