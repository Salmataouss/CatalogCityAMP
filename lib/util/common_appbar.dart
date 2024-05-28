import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/font_family.dart';
import 'package:catalog_city_project/util/size_config.dart';

// ignore: must_be_immutable
class CommonAppbar extends StatelessWidget {
  String? text;
  CommonAppbar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorFile.whiteColor,
      elevation: 0,
      title: Text(
        text ?? "",
        style: TextStyle(
            decorationColor: ColorFile.onBordingColor,
            color: ColorFile.onBordingColor,
            fontFamily: satoshiBold,
            fontWeight: FontWeight.w400,
            fontSize: SizeFile.height22),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: SizeFile.height1,
            top: SizeFile.height20,
            bottom: SizeFile.height20,
          ),
          child: Image.asset(AssetImagePaths.backArrow2,
              height: SizeFile.height18,
              width: SizeFile.height18,
              color: ColorFile.onBordingColor),
        ),
      ),
    );
  }
}
