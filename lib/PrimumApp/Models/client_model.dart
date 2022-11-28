class ClientModel {
  int? id;
  String name;
  String nid;
  String phone;
  String job;
  String address;
  String age;

  ClientModel({
    required this.nid,
    required this.name,
    required this.address,
    required this.phone,
    required this.age,
    required this.job,
  });

  ClientModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        phone = json['phone'],
        job = json['job'],
        age = json['age'],
        nid = json['nid'];
  Map<String,dynamic>toJson(){
    return {
      'id':id,
      'name':name,
      'address':address,
      'phone':phone,
      'job':job,
      'age':age,
      'nid':nid
    };
  }
}
