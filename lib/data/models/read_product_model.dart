import 'package:crud_app/data/models/read_product_data.dart';

class ReadProductModel {
  String? status;
  List<ReadProductData>? readProduct;

  ReadProductModel({this.status, this.readProduct});

  ReadProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      readProduct = <ReadProductData>[];
      json['data'].forEach((v) {
        readProduct!.add(ReadProductData.fromJson(v));
      });
    }
  }
}


