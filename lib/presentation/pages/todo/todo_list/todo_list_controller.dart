import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_form/todo_form_page.dart';

class TodoEntity {
  final int id;
  final String title;
  final String description;
  final bool finalized;

  TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.finalized,
  });

  factory TodoEntity.empty() {
    return TodoEntity(id: 0, title: '', description: '', finalized: false);
  }

  TodoEntity copyWith({
    int? id,
    String? title,
    String? description,
    bool? finalized,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      finalized: finalized ?? this.finalized,
    );
  }
}

class TodoListController extends GetxController {
  final todoList = <TodoEntity>[
    TodoEntity(
        id: 1, title: 'Estudar GetX', description: 'teste 1', finalized: true),
    TodoEntity(
        id: 2, title: 'Estudar Bloc', description: 'teste 2', finalized: false),
    TodoEntity(
        id: 3,
        title: 'Estudar teste',
        description: 'teste 3',
        finalized: false),
  ].obs;

  Future<void> openForm([TodoEntity? todo]) async {
    final result = await Get.toNamed(TodoFormPage.route, arguments: todo);
    if (result != null) {
      if (todo == null) {
        todoList.add(result!);
      } else {
        todoList.value = [
          ...todoList.map((todo) => _searchAndUpdateTodo(result, todo))
        ];
      }
    }
  }

  TodoEntity _searchAndUpdateTodo(TodoEntity newTodo, TodoEntity oldTodo) {
    if (newTodo.id == oldTodo.id) {
      return newTodo;
    }
    return oldTodo;
  }

  void toggleStatus(int id) {
    todoList.value = [
      ...todoList.map((todo) => _searchAndChangeStatus(todo, id))
    ];
  }

  TodoEntity _searchAndChangeStatus(TodoEntity todo, int id) {
    if (todo.id == id) {
      return todo.copyWith(finalized: !todo.finalized);
    }
    return todo;
  }
}
