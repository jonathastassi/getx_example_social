import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:getx_example_social/presentation/translations/en_US/en_us_translation.dart';
import 'package:getx_example_social/presentation/translations/es_MX/es_mx_translation.dart';
import 'package:getx_example_social/presentation/translations/pt_BR/pt_br_translation.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'pt_BR': ptBR,
    'en_US': enUs,
    'es_mx': esMx
  };
}
