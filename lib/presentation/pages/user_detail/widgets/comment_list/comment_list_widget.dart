import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/comment_list/comment_list_controller.dart';
import 'package:getx_example_social/presentation/widgets/loading_widget.dart';

class CommentListWidget extends GetWidget<CommentListController> {
  final int postId;

  const CommentListWidget({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentListController>(
      init: controller,
      initState: (_) => controller.fetchList(postId),
      builder: (_) => Obx(
        () => Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 48, 8, 8),
              constraints: BoxConstraints(
                maxHeight: Get.size.height * 0.8,
                minHeight: Get.size.height * 0.2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final comment = controller.commentList[index];

                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: Text(comment.name),
                          subtitle: Text(comment.email),
                        ),
                        ListTile(
                          title: Text(comment.body),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.commentList.length,
              ),
            ),
            Positioned(
              top: 2,
              left: 2,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(
                  Icons.close,
                ),
              ),
            ),
            if (controller.isLoading.value) LoadingWidget(),
          ],
        ),
      ),
    );
  }
}
