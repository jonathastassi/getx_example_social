import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_list/todo_list_controller.dart';

class TodoFormController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final Rx<TodoEntity> _todo = Rx<TodoEntity>(Get.arguments ?? TodoEntity.empty());
  TodoEntity get todo => _todo.value;

  TodoEntity updateTodo({
    String? title,
    String? description,
  }) {
    return _todo.value = _todo.value.copyWith(
      title: title,
      description: description,
    );
  }

  void save() {
    if (formKey.currentState!.validate()) {
      Get.back(result: todo);      
    }
  }
}