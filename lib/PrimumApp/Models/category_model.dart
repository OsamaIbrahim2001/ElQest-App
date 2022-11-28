class CategoryModel {
  int? id;
  String name;
  String image;

  CategoryModel(
      {required this.name,
       required this.image });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}