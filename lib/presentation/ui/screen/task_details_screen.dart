import 'package:crud_app/data/controllers/home_read_product_list_controller.dart';
import 'package:crud_app/data/models/read_product_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.product});

  final ReadProductData product;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

final HomeReadProductListController _controller =
    Get.put(HomeReadProductListController());

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    _controller.getReadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            height: 200,
            width: 300,
            child: Image.network(widget.product.img ?? ''),
          ),
          const SizedBox(height: 50),
          const Text(
            'Product Details',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                'Name: ${widget.product.productName ?? ''}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  Text(
                    'Quantity: ${widget.product.qty ?? ''}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Unt Price: ${widget.product.unitPrice ?? ''}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Total Price: ${widget.product.totalPrice ?? ''}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: Text(
          'Crud',
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
