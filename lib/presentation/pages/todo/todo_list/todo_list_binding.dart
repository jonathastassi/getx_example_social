import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_list/todo_list_controller.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoListController>(() => TodoListController());
  }
}