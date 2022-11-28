class ProductModel {
  int? id;
  String name;
  String description;
  String color;
  double price;
  String defaultImage;
  int quantity;
  int categoryId;

  ProductModel({
    required this.quantity,
    required this.name,
    required this.description,
    required this.color,
    required this.price,
    required this.defaultImage,
    required this.categoryId,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        quantity = json['quantity'],
        name = json['name'],
        description = json['description'],
        color = json['color'],
        price = json['price'],
        defaultImage = json['defaultImage'],
        categoryId = json['categoryId'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'color': color,
      'price': price,
      'defaultImage': defaultImage,
      'categoryId': categoryId,
      'quantity':quantity
    };
  }
}
