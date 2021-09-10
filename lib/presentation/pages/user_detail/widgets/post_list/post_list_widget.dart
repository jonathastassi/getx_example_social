import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/post_list/post_list_controller.dart';
import 'package:getx_example_social/presentation/widgets/loading_widget.dart';

class PostListWidget extends GetWidget<PostListController> {
  final int userId;

  const PostListWidget({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostListController>(
      init: controller,
      initState: (_) => controller.fetchList(userId),
      builder: (_) => Obx(
        () => Stack(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final postEntity = controller.postList[index];

                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                          ),
                          child: Text(
                            postEntity.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          postEntity.body,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Comments'),
                            onPressed: () => controller.openComments(postEntity.id),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: controller.postList.length,
            ),
            if (controller.isLoading.value) LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
