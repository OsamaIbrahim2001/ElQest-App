import 'package:flutter/material.dart';

class ElQestPayModel {
  int? id;
  int clientId;
  int productId;
  String payDate;
  double price;
  int elqestId;


  ElQestPayModel(
  {required this.clientId,
  required this.productId,
  required this.payDate,
  required this.price,
  required this.elqestId,
  });

  ElQestPayModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
  clientId = json['clientId'],
  productId = json['productId'],
        payDate = json['payDate'],
  price = json['price'],
  elqestId=json['elqestId'];
  Map<String, dynamic> toJson() {
  return {
  'id': id,
  'clientId': clientId,
  'productId': productId,
  'payDate': payDate,
  'price': price,
  'elqestId':elqestId,
  };
  }
  }

