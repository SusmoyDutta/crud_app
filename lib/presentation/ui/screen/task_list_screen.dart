import 'package:crud_app/data/controllers/delete_product_controller.dart';
import 'package:crud_app/data/controllers/home_read_product_list_controller.dart';
import 'package:crud_app/presentation/ui/screen/create_list_screen.dart';
import 'package:crud_app/presentation/ui/screen/edit_list_screen.dart';
import 'package:crud_app/presentation/widget/center_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final HomeReadProductListController _controller =
      Get.put(HomeReadProductListController());
  @override
  void initState() {
    super.initState();
    _controller.getReadProduct();
    Get.put(DeleteProductController());
  }
  Future<void> _getRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _controller.getReadProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () => _getRefresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const CreateListScreen(),
                  );
                },
                child: const Text('ADD NEW STUDENT'),
              ),
            ),
            buildCreateTask(),
            Container(height: 2, color: Colors.black38),
            buildProductList(),
          ],
        ),
      ),
    );
  }

  GetBuilder<HomeReadProductListController> buildProductList() {
    return GetBuilder<HomeReadProductListController>(
              builder: (homeReadProductListController) {
            return Expanded(
              child: ListView.builder(
                itemCount: homeReadProductListController.readProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 30,
                                  child: Image.network(
                                    homeReadProductListController
                                            .readProduct[index].img ??
                                        '',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                homeReadProductListController
                                        .readProduct[index].productName ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              buildPopupMenuBar(homeReadProductListController
                                  .readProduct[index].id),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          });
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
  Widget buildPopupMenuBar(id) {
    return PopupMenuButton(
      onSelected: (item) => popupBarOnTap(context, item, id),
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                Icon(
                  Icons.edit_note_sharp,
                  size: 24,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Edite'),
              ],
            ),
          ),
           PopupMenuItem(
            value: 1,
            child: GetBuilder<DeleteProductController>(
              builder: (deleteProductController) {
                if(deleteProductController.inProgress){
                  return const CenterInProgress();
                }
                deleteProductController.getDeleteProduct(id);
                return const Row(
                  children: [
                    Icon(
                      Icons.delete_sweep_outlined,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Delete')
                  ],
                );
              }
            ),
          ),
        ];
      },
      child: const Icon(Icons.more_vert),
    );
  }

  Widget buildCreateTask() {
    return const SizedBox(
      height: 50,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Product List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void popupBarOnTap(BuildContext context,  item, id) {

  if (item== 0) {
    Get.to(() => EditListScreen(
      id: id,
    ));
  }
  if (item == 1) {
    DeleteProductController deleteProductController = Get.find<DeleteProductController>();
    deleteProductController.getDeleteProduct(id);
  }
}