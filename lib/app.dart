import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/app_binding.dart';
import 'package:getx_example_social/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Example Social',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initialRoute,
      getPages: Routes.pages,
      initialBinding: AppBinding(),
    );
  }
}