import 'package:get/get.dart';
import 'package:getx_example_social/data/repositories/post_repository.dart';
import 'package:getx_example_social/domain/usecases/post/get_post_list_by_user.dart';
import 'package:getx_example_social/presentation/pages/user_detail/user_detail_controller.dart';
import 'package:getx_example_social/presentation/pages/user_detail/widgets/post_list/post_list_controller.dart';

class UserDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(() {
      return UserDetailController();
    });
    Get.lazyPut<PostListController>(() {
      return PostListController(
        getPostListByUser: GetPostListByUser(
          postRepository: PostRepository(
            httpClient: Get.find(),
          ),
        ),
      );
    });
  }
}
