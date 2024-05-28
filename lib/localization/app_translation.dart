import 'package:catalog_city_project/localization/ar_sa.dart';
import 'package:catalog_city_project/localization/de_de.dart';
import 'package:catalog_city_project/localization/en_us.dart';
import 'package:catalog_city_project/localization/fr_fr.dart';
import 'package:catalog_city_project/localization/hi_in.dart';
import 'package:catalog_city_project/localization/zn_ch.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": enUS,
    "hi": hiIN,
    "ar": arSA,
    "de": deDE,
    "fr": frFR,
    "zh": zhCN
  };
}
