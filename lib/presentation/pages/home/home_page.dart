import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/home/home_controller.dart';
import 'package:getx_example_social/presentation/widgets/drawer_menu.dart';

class HomePage extends GetView<HomeController> {
  static final String route = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example Social'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.counter.toString(),
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: 1,
              onPressed: controller.increment,
              child: Icon(
                Icons.add,
              ),
            ),
            FloatingActionButton(
              heroTag: 2,
              onPressed: controller.decrement,
              child: Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
