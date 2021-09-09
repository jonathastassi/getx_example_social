import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/data/http/http_client.dart';
import 'package:getx_example_social/data/http/i_http_client.dart';

class CommonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() {
      return Dio();
    });
    Get.lazyPut<IHttpClient>(() {
      return HttpClient(
        dio: Get.find(),
      );
    });
  }
}
