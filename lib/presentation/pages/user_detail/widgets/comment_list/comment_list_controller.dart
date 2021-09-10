import 'package:get/get.dart';
import 'package:getx_example_social/domain/entities/comment_entity.dart';
import 'package:getx_example_social/domain/entities/post_entity.dart';
import 'package:getx_example_social/domain/usecases/comment/get_comment_list_by_post.dart';
import 'package:getx_example_social/domain/usecases/post/get_post_list_by_user.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/comment_list/comment_list_widget.dart';

class CommentListController extends GetxController {
  final GetCommentListByPost getCommentListByPost;

  final commentList = <CommentEntity>[].obs;
  final isLoading = false.obs;

  CommentListController({
    required this.getCommentListByPost,
  });

  @override
  void onInit() {
    super.onInit();
    commentList.clear();
  }

  Future<void> fetchList(int postId) async {
    isLoading.value = true;

    final result =
        await getCommentListByPost.call(GetCommentListByPostParams(postId: postId));

    result.fold((error) {
      print(error);
      isLoading.value = false;
    }, (data) {
      commentList.value = data;
      isLoading.value = false;
    });
  }
}
