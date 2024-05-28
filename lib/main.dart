import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/localization/app_translation.dart';
import 'package:catalog_city_project/util/app_routes.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/string_config.dart';

import 'controller/storage_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? languageCode = await StorageController.instance.getLanguage();
  String? countryCode = await StorageController.instance.getCountryCode();
  runApp(MyApp(
    languageCode: languageCode,
    countryCode: countryCode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.languageCode, this.countryCode});

  final String? languageCode;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      debugShowCheckedModeBanner: false,
      title: StringConfig.appName,
      theme: ThemeData(primaryColor: ColorFile.appColor),
      //initialRoute: AppRoutes.splashScreen,
      initialRoute: AppRoutes.homeScreen, // Changer la route ici
      locale: Locale(languageCode ?? "en", countryCode ?? "US"),
      routes: AppRoutes.routes,
    );
  }
}
