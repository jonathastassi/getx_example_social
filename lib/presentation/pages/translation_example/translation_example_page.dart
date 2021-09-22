import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example_social/presentation/widgets/drawer_menu.dart';

class TranslationExamplePage extends StatelessWidget {
  static final String route = '/translation-example';

  const TranslationExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translation'),
      ),
      body: Center(
        child: Text(
          'oi'.tr,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      drawer: DrawerMenu(),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => Get.updateLocale(Locale('pt', 'BR')),
            child: Text('pt-BR'),
          ),
          ElevatedButton(
            onPressed: () => Get.updateLocale(Locale('en', 'US')),
            child: Text('en-US'),
          ),
          ElevatedButton(
            onPressed: () => Get.updateLocale(Locale('es', 'mx')),
            child: Text('es-MX'),
          ),
        ],
      ),
    );
  }
}
