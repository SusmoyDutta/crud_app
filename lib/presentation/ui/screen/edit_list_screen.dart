import 'package:crud_app/data/controllers/auth_controller.dart';
import 'package:crud_app/data/controllers/update_product_controllers.dart';
import 'package:crud_app/data/models/create_product_data_list.dart';
import 'package:crud_app/presentation/ui/screen/home_screen.dart';
import 'package:crud_app/presentation/widget/appbar_image_logo.dart';
import 'package:crud_app/presentation/widget/center_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditListScreen extends StatefulWidget {
  const EditListScreen({super.key, required this.id});
  final String id;
  @override
  State<EditListScreen> createState() => _EditListScreenState();
}
class _EditListScreenState extends State<EditListScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productImageUrlTEController =
      TextEditingController();
  final TextEditingController _productQuantityTEController =
      TextEditingController();
  final TextEditingController _productUnitPriceTEController =
      TextEditingController();
  final TextEditingController _productTotalPriceTEController =
      TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _productImageUrlTEController.text = AuthController.uerData?.img ?? '';
    _productNameTEController.text = AuthController.uerData?.productName ?? '';
    _productCodeTEController.text = AuthController.uerData?.productCode ?? '';
    _productQuantityTEController.text = AuthController.uerData?.qty ?? '';
    _productUnitPriceTEController.text =
        AuthController.uerData?.unitPrice ?? '';
    _productTotalPriceTEController.text =
        AuthController.uerData?.totalPrice ?? '';
    Get.put(UpdateProductControllers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildTextFromController(),
        ),
      ),
    );
  }

  Widget buildTextFromController() {
    return Form(
          key: _fromKey,
          child: Column(
            children: [
              const AppBarImageLogo(
                height: 150,
                width: 170,
              ),
              const Text(
                'UpDate Item',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildProductName(),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _productImageUrlTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Image Url ',
                  labelText: 'Image Url',
                ),
                validator: (String? values) {
                  if (values!.isEmpty) {
                    return 'Enter your Product Image Url';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _productQuantityTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Quantity',
                  labelText: 'Product Quantity',
                ),
                validator: (String? values) {
                  if (values!.isEmpty) {
                    return 'Enter your Product Quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _productUnitPriceTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Unit Price',
                  labelText: 'Product Unit Price',
                ),
                validator: (String? values) {
                  if (values!.isEmpty) {
                    return 'Enter your Product Unit Price';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _productTotalPriceTEController,
                decoration: const InputDecoration(
                  hintText: 'Product Total Price',
                  labelText: 'Product Total Price',
                ),
                validator: (String? values) {
                  if (values!.isEmpty) {
                    return 'Enter your Product Total Price';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<UpdateProductControllers>(
                  builder: (updateProductControllers) {
                if (updateProductControllers.inProgress) {
                  return const CenterInProgress();
                }
                return ElevatedButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      updateProductControllers.getUpdateProduct(
                        widget.id,
                        CreateProductDataList(
                          img: _productImageUrlTEController.text,
                          productName: _productNameTEController.text,
                          productCode: _productCodeTEController.text,
                          qty: _productQuantityTEController.text,
                          unitPrice: _productUnitPriceTEController.text,
                          totalPrice: _productTotalPriceTEController.text,
                        ),
                      );
                      Get.to(() => const HomeScreen());
                    }
                  },
                  child: const Text('Save'),
                );
              }),
            ],
          ),
        );
  }

  Widget buildProductName() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    controller: _productNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Product Name',
                      labelText: 'Product Name',
                    ),
                    validator: (String? values) {
                      if (values!.isEmpty) {
                        return 'Enter your Product Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    controller: _productCodeTEController,
                    decoration: const InputDecoration(
                      hintText: 'Product Code',
                      labelText: 'Product Code',
                    ),
                    validator: (String? values) {
                      if (values!.isEmpty) {
                        return 'Enter your Product Code';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            );
  }
}
