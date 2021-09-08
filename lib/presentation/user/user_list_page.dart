import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/user/user_list_controller.dart';

class UserListPage extends GetView<UserListController> {
  static final String route = '/user-list';

  const UserListPage({Key? key}) : super(key: key);

  String _getInitial(String name) {
    final nameSplited = name.split(' ');

    return '${nameSplited.first.substring(0, 1)}${nameSplited.last.substring(0, 1)}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.people),
        title: Text('Users'),
        actions: [
          IconButton(onPressed: controller.fetchList, icon: Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final user = controller.userList[index];
                return ListTile(
                  onTap: () {
                    print('eita');
                  },
                  leading: CircleAvatar(
                    child: Text(_getInitial(user.name)),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
              itemCount: controller.userList.length,
            ),
            if (controller.isLoading.value)
              Container(
                height: size.height,
                width: size.width,
                color: Colors.white70,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}
