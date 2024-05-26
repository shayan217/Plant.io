import 'dart:convert';

import 'package:plantpal/models/products_model/products_model.dart';


OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

class OrderModel {
  OrderModel(
      {required this.orderId,
      required this.payment,
      required this.products,
      required this.status,
      required this.totalPrice});

  String orderId;
  String payment;
  List<ProductModel> products;
  String status;
  double totalPrice;

  factory OrderModel.fromJson(Map<String, dynamic>? json) {
    List<dynamic> productMap = json!["products"];
    return OrderModel(
      orderId: json["orderId"] ,
      payment: json["payment"] ,
      products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
      status: json["status"],
      totalPrice: json["totalPrice"] ,
    );
  }


}
