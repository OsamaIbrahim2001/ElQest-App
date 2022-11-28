class ElqestModel {
  int? id;
  int clientId;
  int productId;
  String buyDate;
  double price;
  int quantity;
  String firstPayed;

  ElqestModel(
      {required this.clientId,
      required this.productId,
      required this.buyDate,
      required this.price,
        required this.quantity,
      required this.firstPayed});

  ElqestModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        clientId = json['clientId'],
        productId = json['productId'],
        buyDate = json['buyDate'],
        price = json['price'],
  quantity=json['quantity'],
        firstPayed = json['firstPayed'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'productId': productId,
      'buyDate': buyDate,
      'price': price,
      'quantity':quantity,
      'firstPayed': firstPayed,
    };
  }
}
