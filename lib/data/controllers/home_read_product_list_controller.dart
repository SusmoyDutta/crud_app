import 'package:crud_app/data/models/network_response.dart';
import 'package:crud_app/data/models/read_product_data.dart';
import 'package:crud_app/data/models/read_product_model.dart';
import 'package:crud_app/data/network_caller/network_caller.dart';
import 'package:crud_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class HomeReadProductListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ReadProductData> _readProduct = [];
  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  List<ReadProductData> get readProduct => _readProduct;

  Future<bool> getReadProduct() async {
   bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.readProduct);
    if(response.isSuccess || response.responseCode == 200){
      _readProduct = ReadProductModel.fromJson(response.responseData).readProduct ?? [];
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage ?? 'read product list is failed';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
