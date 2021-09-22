import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/translations/app_translations.dart';
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
      translations: AppTranslation(), // suas traduções
      locale: Locale('pt', 'BR'), // as traduções serão exibidas para esta localidade
    );
  }
}