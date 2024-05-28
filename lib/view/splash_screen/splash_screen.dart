import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/size_config.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../util/font_family.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () => Get.off(const OnBoardingScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(AssetImagePaths.splashScreenLogo,
                  height: SizeFile.height180)),
          const SizedBox(height: SizeFile.height20),
          const Text(StringConfig.primeTravelApp,
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 0.345,
                  fontSize: SizeFile.height12,
                  color: ColorFile.onBordingColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: satoshiBold))
        ],
      ),
    );
  }
}
