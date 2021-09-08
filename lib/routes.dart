import 'package:get/get.dart';
import 'package:getx_example_social/presentation/user/user_list_binding.dart';
import 'package:getx_example_social/presentation/user/user_list_page.dart';

class Routes {
  static final initialRoute = UserListPage.route;

  static final pages = [
    GetPage(
      name: UserListPage.route,
      page: () => UserListPage(),
      binding: UserListBinding(),
    ),
  ];
}
