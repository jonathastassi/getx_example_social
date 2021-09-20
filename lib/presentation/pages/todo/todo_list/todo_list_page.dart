import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_list/todo_list_controller.dart';
import 'package:getx_example_social/presentation/widgets/drawer_menu.dart';

class TodoListPage extends GetView<TodoListController> {
  static final String route = '/todo/list';

  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) {
              final todo = controller.todoList.elementAt(index);

              return Dismissible(
                key: Key(todo.id.toString()),
                child: InkWell(
                  onTap: () => controller.openForm(todo),
                  child: Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: todo.finalized,
                        onChanged: (_) => controller.toggleStatus(todo.id),
                      ),
                      title: Text(todo.title),
                    ),
                  ),
                ),
                confirmDismiss: (dir) async => false,
                onDismissed: (dir) {},
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.delete),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.thumb_up),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.openForm,
        child: Icon(Icons.add_circle_outline_outlined),
      ),
      drawer: DrawerMenu(),
    );
  }
}
