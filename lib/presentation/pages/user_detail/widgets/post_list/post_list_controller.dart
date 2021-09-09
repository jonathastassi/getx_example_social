import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';
import 'package:getx_example_social/domain/usecases/post/get_post_list_by_user.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/comment_list/comment_list_widget.dart';

class PostListController extends GetxController {
  final GetPostListByUser getPostListByUser;

  final postList = <PostEntity>[].obs;
  final isLoading = false.obs;

  PostListController({
    required this.getPostListByUser,
  });

  Future<void> fetchList(int userId) async {
    isLoading.value = true;

    final result =
        await getPostListByUser.call(GetPostListByUserParams(userId: userId));

    result.fold((error) {
      print(error);
      isLoading.value = false;
    }, (data) {
      postList.value = data;
      isLoading.value = false;
    });
  }

  void openComments(int postId) {
    Get.bottomSheet(CommentListWidget(postId: postId),);
  }
}
