import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_form/todo_form_controller.dart';

class TodoFormPage extends GetView<TodoFormController> {
  static final String route = '/todo/form';

  const TodoFormPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                initialValue: controller.todo.title,
                onChanged: (title) => controller.updateTodo(title: title),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(           
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Description',  
                ),
                initialValue: controller.todo.description,
                onChanged: (description) => controller.updateTodo(description: description),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.save,
        child: Icon(Icons.save),
      ),
    );
  }
}