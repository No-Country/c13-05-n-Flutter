class ActivitiesModel {
  final String paymentName;
  final String amount;
  final String transactionType;
  final int productNumber;
  final String paymentDate;

  ActivitiesModel(
    this.paymentName,
    this.amount,
    this.transactionType,
    this.productNumber,
    this.paymentDate,
  );

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesModel(
      json['paymentName'] ?? "empty",
      json['amount'],
      json['transactionType'] ?? "empty",
      json['productNumber'] ?? 0,
      json['paymentDate'] ?? "",
    );
  }
}
