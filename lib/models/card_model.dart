class CardModel {
  final String productName;
  final int balance;
  final bool status;
  final String productType;
  final int productNumber;
  final String expirationDate;
  final String openDate;

  CardModel(this.productName, this.balance, this.status, this.productType,
      this.productNumber, this.expirationDate, this.openDate);

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      json['productName'],
      json['balance'],
      json['status'],
      json['productType'],
      json['productNumber'],
      json['expirationDate'] ?? "",
      json['openDate'] ?? "",
    );
  }
}
