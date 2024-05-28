import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/size_config.dart';
import '../../util/font_family.dart';
import '../../util/string_config.dart';
import 'edit_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, this.isAppbar = false}) : super(key: key);
  bool isAppbar;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorFile.whiteColor,
        appBar: widget.isAppbar
            ? null
            : AppBar(
                backgroundColor: ColorFile.whiteColor,
                centerTitle: true,
                title: Text(StringConfig.profile,
                    style: const TextStyle(
                        decorationColor: ColorFile.onBordingColor,
                        color: ColorFile.onBordingColor,
                        fontFamily: satoshiBold,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeFile.height22)),
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeFile.height5,
                        top: SizeFile.height20,
                        bottom: SizeFile.height20,
                      ),
                      child: Image.asset(AssetImagePaths.backArrow2,
                          height: SizeFile.height18,
                          width: SizeFile.height18,
                          color: ColorFile.onBordingColor),
                    )),
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.to(EditScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          right: SizeFile.height40, left: SizeFile.height20),
                      child: Text(StringConfig.edit,
                          style: TextStyle(
                              decorationColor: ColorFile.onBordingColor,
                              color: ColorFile.appColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height16)),
                    ),
                  )
                ],
              ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SizeFile.height20),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset(AssetImagePaths.profileImage,
                        height: SizeFile.height126, width: SizeFile.height126),
                    Padding(
                      padding: const EdgeInsets.only(bottom: SizeFile.height15),
                      child: GestureDetector(
                          onTap: () {
                            pickImageC();
                          },
                          child: Image.asset(
                            AssetImagePaths.plusIcon,
                            height: SizeFile.height24,
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetImagePaths.userIcon,
                    color: ColorFile.appColor,
                    height: SizeFile.height16,
                    width: SizeFile.height16,
                  ),
                  const SizedBox(
                    width: SizeFile.height12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: SizeFile.height18),
                          child: Text(StringConfig.name,
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height18)),
                        ),
                        Text(StringConfig.adolCooper,
                            style: TextStyle(
                                color: ColorFile.orContinue,
                                fontFamily: satoshiRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeFile.height20),
              Container(
                width: Get.width,
                height: SizeFile.height1,
                color: ColorFile.verticalDividerColor,
              ),
              const SizedBox(height: SizeFile.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetImagePaths.phoneNumberIcon,
                    color: ColorFile.appColor,
                    height: SizeFile.height16,
                    width: SizeFile.height16,
                  ),
                  const SizedBox(
                    width: SizeFile.height12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: SizeFile.height18),
                          child: Text(StringConfig.phoneNumber,
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height18)),
                        ),
                        Text(StringConfig.phone910000000000,
                            style: TextStyle(
                                color: ColorFile.orContinue,
                                fontFamily: satoshiRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeFile.height20),
              Container(
                width: Get.width,
                height: SizeFile.height1,
                color: ColorFile.verticalDividerColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetImagePaths.emailIcon,
                    color: ColorFile.appColor,
                    height: SizeFile.height16,
                    width: SizeFile.height16,
                  ),
                  const SizedBox(
                    width: SizeFile.height12,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: SizeFile.height18),
                          child: Text(StringConfig.emailId,
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height18)),
                        ),
                        Text(StringConfig.exampleGmailCom,
                            style: TextStyle(
                                color: ColorFile.orContinue,
                                fontFamily: satoshiRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeFile.height20),
              Container(
                width: Get.width,
                height: SizeFile.height1,
                color: ColorFile.verticalDividerColor,
              ),
              const SizedBox(height: SizeFile.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetImagePaths.calendarIcon,
                    color: ColorFile.appColor,
                    height: SizeFile.height16,
                    width: SizeFile.height16,
                  ),
                  const SizedBox(width: SizeFile.height12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: SizeFile.height18),
                          child: Text(StringConfig.dateOfBirth,
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiRegular,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height18)),
                        ),
                        Text(StringConfig.date11Aug2002,
                            style: TextStyle(
                                color: ColorFile.orContinue,
                                fontFamily: satoshiRegular,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeFile.height20),
              Container(
                width: Get.width,
                height: SizeFile.height1,
                color: ColorFile.verticalDividerColor,
              ),
            ],
          ),
        ));
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
}
