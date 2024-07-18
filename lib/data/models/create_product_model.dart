import 'package:crud_app/data/models/create_product_data_list.dart';

class CreateProductModel {
  String? status;
  CreateProductDataList? createProduct;

  CreateProductModel({this.status, this.createProduct});

  CreateProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    createProduct = json['data'] != null ? CreateProductDataList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (createProduct != null) {
      data['data'] = createProduct!.toJson();
    }
    return data;
  }
}


