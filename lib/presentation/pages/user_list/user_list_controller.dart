import 'package:get/get.dart';
import 'package:getx_example_social/core/usecases/usecase.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';
import 'package:getx_example_social/domain/usecases/user/get_user_list.dart';
import 'package:getx_example_social/presentation/pages/user_detail/user_detail_page.dart';

class UserListController extends GetxController {
  final GetUserList getUserList;

  final userList = <UserEntity>[].obs;
  final isLoading = false.obs;

  UserListController({
    required this.getUserList,
  });  

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  Future<void> fetchList() async {
    isLoading.value = true;

    final result = await getUserList.call(NoParams());

    result.fold((error) {
      print(error);
      isLoading.value = false;
    }, (data) {
      userList.value = data;
      isLoading.value = false;
    });
  }

  void openUserDetail(UserEntity user) {
    Get.toNamed(UserDetailPage.route, arguments: user);
  }
}
