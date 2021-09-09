import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
  }
}
