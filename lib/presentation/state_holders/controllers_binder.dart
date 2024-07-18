import 'package:crud_app/data/controllers/create_product_controllers.dart';
import 'package:crud_app/data/controllers/delete_product_controller.dart';
import 'package:crud_app/data/controllers/home_read_product_list_controller.dart';
import 'package:crud_app/data/controllers/update_product_controllers.dart';
import 'package:get/get.dart';

class ControllersBinder extends Bindings{
  @override
  void dependencies() {
   HomeReadProductListController();
   CreateProductControllers();
   UpdateProductControllers();
   DeleteProductController();
  }
}