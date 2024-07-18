import 'package:crud_app/data/models/create_product_data_list.dart';
import 'package:crud_app/data/models/network_response.dart';
import 'package:crud_app/data/network_caller/network_caller.dart';
import 'package:crud_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class CreateProductControllers extends GetxController {
  bool _inProgress = false;
  String _errorMessages = '';
  final bool _isSuccess = false;

  bool get inProgress => _inProgress;

  String get errorMessages => _errorMessages;
  bool get isSuccess => _isSuccess;

  Future<bool> getCreateProduct(
      CreateProductDataList createProductDataList) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createProduct,
      body: createProductDataList.toJson(),
    );
    if (response.isSuccess || response.responseCode == 200) {
      isSuccess = true;
    } else {
      _errorMessages = response.errorMessage ?? 'Create Product is error';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
