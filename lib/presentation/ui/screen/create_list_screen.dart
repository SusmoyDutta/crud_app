import 'package:crud_app/data/controllers/create_product_controllers.dart';
import 'package:crud_app/data/models/create_product_data_list.dart';
import 'package:crud_app/presentation/widget/appbar_image_logo.dart';
import 'package:crud_app/presentation/widget/center_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateListScreen extends StatefulWidget {
  const CreateListScreen({super.key});

  @override
  State<CreateListScreen> createState() => _CreateListScreenState();
}

class _CreateListScreenState extends State<CreateListScreen> {
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
    Get.put(CreateProductControllers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const AppBarImageLogo(
                height: 150,
                width: 170,
              ),
              const Text(
                'Create Item',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    Row(
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
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your Product Name';
                              } else {
                                return null;
                              }
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
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your Product Code';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _productImageUrlTEController,
                      decoration: const InputDecoration(
                        hintText: 'Product Image Url ',
                        labelText: 'Image Url',
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your Product Image Url';
                        } else {
                          return null;
                        }
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
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your Product Quantity';
                        } else {
                          return null;
                        }
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
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your Product Unit Price';
                        } else {
                          return null;
                        }
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
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter your Product Total Price';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<CreateProductControllers>(
                      builder: (createProductControllers) {
                        if (createProductControllers.inProgress) {
                          return const CenterInProgress();
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              CreateProductDataList createData =
                                  CreateProductDataList(
                                img: _productImageUrlTEController.text,
                                productName: _productNameTEController.text,
                                productCode: _productCodeTEController.text,
                                unitPrice: _productUnitPriceTEController.text,
                                qty: _productQuantityTEController.text,
                                totalPrice: _productTotalPriceTEController.text,
                              );
                              createProductControllers
                                  .getCreateProduct(createData);
                              Get.back(
                                canPop: true,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.lightGreen,
                                  content: Text('Create Item is Success'),
                                ),
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productTotalPriceTEController.dispose();
    _productQuantityTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productCodeTEController.dispose();
    _productNameTEController.dispose();
    _productImageUrlTEController.dispose();
  }
}
