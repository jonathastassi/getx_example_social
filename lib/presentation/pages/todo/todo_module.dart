import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_example_social/presentation/core/module/module.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_form/todo_form_page.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_list/todo_list_binding.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_list/todo_list_page.dart';

class TodoModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(name: TodoListPage.route, page: () => TodoListPage(), binding: TodoListBinding()),
    GetPage(name: TodoFormPage.route, page: () => TodoFormPage()),
  ];
}