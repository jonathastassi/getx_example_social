import 'package:get/get.dart';
import 'package:getx_example_social/domain/entities/user_entity.dart';

class UserDetailController extends GetxController {

  late final Rx<UserEntity> _user = Rx<UserEntity>(Get.arguments);
  UserEntity get user => _user.value;
}