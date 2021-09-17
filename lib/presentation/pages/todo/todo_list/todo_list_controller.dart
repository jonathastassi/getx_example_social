import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_form/todo_form_page.dart';

class TodoEntity {
  final int id;
  final String title;
  bool finalized;

  TodoEntity({
    required this.id, 
    required this.title, 
    required this.finalized,
  });
}

class TodoListController extends GetxController {
  final todoList = <TodoEntity>[
    TodoEntity(id: 1, title: 'Estudar GetX', finalized: true),
    TodoEntity(id: 2, title: 'Estudar Bloc', finalized: false),
    TodoEntity(id: 3, title: 'Estudar teste', finalized: false),
  ].obs;

  void openForm() {
    Get.toNamed(TodoFormPage.route);
  }

  void setTodoStatus(bool check, int index) {
    todoList.elementAt(index).finalized = check;
    todoList.value = [...todoList];    
  }
}