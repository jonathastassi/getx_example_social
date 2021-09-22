import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationExamplePage extends StatelessWidget {
  static final String route = '/translation-example';

  const TranslationExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'oi'.tr,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => Get.updateLocale(Locale('pt', 'BR')),
            child: Text('PT-BR'),
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
