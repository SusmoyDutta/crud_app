import 'package:crud_app/data/models/network_response.dart';
import 'package:crud_app/data/network_caller/network_caller.dart';
import 'package:crud_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class DeleteProductController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getDeleteProduct(String id) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.deleteProduct(id));
    if (response.isSuccess || response.responseCode == 200) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Delete Product Api is failed';
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
