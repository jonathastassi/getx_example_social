import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_form/todo_form_controller.dart';

class TodoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoFormController>(() => TodoFormController());
  }
}