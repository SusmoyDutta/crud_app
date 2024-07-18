import 'package:crud_app/data/controllers/home_read_product_list_controller.dart';
import 'package:crud_app/data/models/item_model.dart';
import 'package:crud_app/presentation/ui/screen/task_details_screen.dart';
import 'package:crud_app/presentation/ui/screen/task_list_screen.dart';
import 'package:crud_app/presentation/widget/appbar_image_logo.dart';
import 'package:crud_app/presentation/widget/box_container.dart';
import 'package:crud_app/presentation/widget/center_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeReadProductListController _controller =
      Get.put(HomeReadProductListController());
  final List<Item> items = [
    Item(id: 1, color: '#FF5733', text: 'Account Balance', icon: 'warning'),
    Item(id: 2, color: '#FFFF00', text: 'Success Payment', icon: 'check_circle'),
  ];

  @override
  void initState() {
    super.initState();
    _controller.getReadProduct();
  }
  Future<void> _getRefresh()  async {
    await Future.delayed(const Duration(seconds: 1));
    _controller.getReadProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawerMenuBar(),
      appBar: buildAppBar(),
      body: RefreshIndicator(
        onRefresh:() => _getRefresh(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Product Item',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              buildItemHistory(
                items,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Product',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              GetBuilder<HomeReadProductListController>(
                  builder: (homeReadProductListController) {
                if (homeReadProductListController.inProgress) {
                  return const CenterInProgress();
                }
                return buildTaskList(homeReadProductListController);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerMenuBar() {
    return Drawer(
      width: 300,
      child: Column(
        children: [
          const AppBarImageLogo(height: 300,width: 300,),
          const Divider(
            height: 1,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.to(() => const TaskListScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Details',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 25,
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
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: Text(
          'Crud',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  Widget buildTaskList(homeReadProductListController) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeReadProductListController.readProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.to(() => TaskDetailsScreen(
                    product: homeReadProductListController.readProduct[index],
                  ));
            },
            child: SizedBox(
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
                                  'un img',
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildItemHistory(List<Item> items) {
  return SizedBox(
    height: 380,
    child: GetBuilder<HomeReadProductListController>(
        builder: (homeReadProductListController) {
      if (homeReadProductListController.inProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: BoxContainer(
                  height: 180,
                  width: 174,
                  color: index == 1
                      ? Colors.blue.shade100
                      : Colors.orange.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Icon(
                              index == 1
                                  ? Icons.task_alt
                                  : Icons.account_balance,
                              size: 25,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.text,
                          style: const TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                         Padding(
                          padding: const EdgeInsets.only(left: 85),
                          child: Text(homeReadProductListController.readProduct[index].unitPrice ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: BoxContainer(
                  height: 180,
                  width: 174,
                  color:
                      index == 1 ? Colors.lightGreen.shade100 : Colors.indigo.shade100 ,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Icon(
                              index == 1 ? Icons.sms_failed: Icons.school,
                              size:25,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          index == 1 ?'Payment Failed':'Student',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Text(
                            homeReadProductListController.readProduct[index].qty??'',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }),
  );
}
