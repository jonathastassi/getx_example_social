import 'package:get/get.dart';
import 'package:getx_example_social/data/repositories/user_repository.dart';
import 'package:getx_example_social/domain/usecases/user/get_user_list.dart';
import 'package:getx_example_social/presentation/pages/user_list/user_list_controller.dart';

class UserListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetUserList>(
      () => GetUserList(
        userRepository: UserRepository(
          httpClient: Get.find(),
        ),
      ),
    );
    Get.lazyPut<UserListController>(() {
      return UserListController(getUserList: Get.find());
    });
  }
}
