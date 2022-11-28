class ImageProductModel {
  int? id;
  String image;
  int productId;

  ImageProductModel({
    required this.image,
    required this.productId,
  });

  ImageProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        productId = json['productId'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'productId': productId,
    };
  }
}
