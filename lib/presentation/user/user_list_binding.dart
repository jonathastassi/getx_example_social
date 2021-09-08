import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/data/http/http_client.dart';
import 'package:getx_example_social/data/repositories/user_repository.dart';
import 'package:getx_example_social/domain/usecases/user/get_user_list.dart';
import 'package:getx_example_social/presentation/user/user_list_controller.dart';

class UserListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(() {
      return UserListController(
        getUserList: GetUserList(
          userRepository: UserRepository(
            httpClient: HttpClient(
              dio: Dio(),
            ),
          ),
        ),
      );
    });
  }
}
