import 'package:get/get.dart';
import 'package:getx_example_social/presentation/pages/common_binding.dart';
import 'package:getx_example_social/presentation/pages/counter_with_set_state/counter_with_set_state_page.dart';
import 'package:getx_example_social/presentation/pages/home/home_binding.dart';
import 'package:getx_example_social/presentation/pages/home/home_page.dart';
import 'package:getx_example_social/presentation/pages/todo/todo_module.dart';
import 'package:getx_example_social/presentation/pages/user_detail/user_detail_binding.dart';
import 'package:getx_example_social/presentation/pages/user_detail/user_detail_page.dart';
import 'package:getx_example_social/presentation/pages/user_list/user_list_binding.dart';
import 'package:getx_example_social/presentation/pages/user_list/user_list_page.dart';

class Routes {
  static final initialRoute = HomePage.route;

  static final pages = [
    GetPage(
      name: HomePage.route,      
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: CounterWithSetState.route,      
      page: () => CounterWithSetState(),
    ),
    GetPage(
      name: UserListPage.route,
      page: () => UserListPage(),
      bindings: [UserListBinding(),CommonBinding()],
    ),
    GetPage(
      name: UserDetailPage.route,
      page: () => UserDetailPage(),
      bindings: [UserDetailBinding()],
    ),
    ...TodoModule().routers
  ];
}
