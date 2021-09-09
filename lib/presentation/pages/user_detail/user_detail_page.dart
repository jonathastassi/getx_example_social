import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/user_detail/user_detail_controller.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/post_list/post_list_widget.dart';

class UserDetailPage extends GetView<UserDetailController> {
  static final String route = '/user-detail';

  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(controller.user.name),
              Text(
                controller.user.email,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list_alt),
                text: 'Posts',
              ),
              Tab(
                icon: Icon(Icons.people),
                text: 'Info',
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            PostListWidget(userId: controller.user.id),
            Center(
              child: Text('Person'),
            )
          ],
        ),
      ),
    );
  }
}
