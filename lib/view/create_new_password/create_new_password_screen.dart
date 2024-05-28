import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/create_new_password_controller.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/common_button.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import '../login_screem/login_screen.dart';

// ignore: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({Key? key}) : super(key: key);

  CreateNewPasswordController createNewPasswordController =
      Get.put(CreateNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SizeFile.height20),
              GestureDetector(
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
                  )),
              const SizedBox(height: SizeFile.height30),
              const Text(StringConfig.createNewAccount,
                  style: TextStyle(
                      fontSize: SizeFile.height26,
                      color: ColorFile.onBordingColor,
                      fontFamily: satoshiMedium)),
              const SizedBox(height: SizeFile.height4),
              const Text(StringConfig.createANewPassword,
                  style: TextStyle(
                      fontSize: SizeFile.height14,
                      color: ColorFile.onBording2Color,
                      fontFamily: satoshiRegular)),
              const SizedBox(height: SizeFile.height30),
              Obx(() => TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    obscureText:
                        !createNewPasswordController.enterPassword.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(SizeFile.height8)),
                        hintText: StringConfig.enterPassword,
                        hintStyle: const TextStyle(
                            fontSize: SizeFile.height14,
                            color: ColorFile.orContinue),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(SizeFile.height12),
                          child: Image.asset(
                            AssetImagePaths.passwordLock,
                            height: SizeFile.height18,
                            width: SizeFile.height18,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            createNewPasswordController.enterPassword.toggle();
                          },
                          child: createNewPasswordController.enterPassword.value
                              ? Padding(
                                  padding:
                                      const EdgeInsets.all(SizeFile.height12),
                                  child: Image.asset(
                                      AssetImagePaths.passwordVisible,
                                      height: SizeFile.height20,
                                      width: SizeFile.height20),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.all(SizeFile.height12),
                                  child: Image.asset(
                                      AssetImagePaths.passwordNotVisible,
                                      height: SizeFile.height20,
                                      width: SizeFile.height20),
                                ),
                        )),
                  )),
              const SizedBox(height: SizeFile.height20),
              Obx(() => TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    obscureText:
                        !createNewPasswordController.conformPassword.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(SizeFile.height8)),
                        hintText: StringConfig.enterConfirmPassword,
                        hintStyle: const TextStyle(
                            fontSize: SizeFile.height14,
                            color: ColorFile.orContinue),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(SizeFile.height12),
                          child: Image.asset(
                            AssetImagePaths.passwordLock,
                            height: SizeFile.height12,
                            width: SizeFile.height15,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            createNewPasswordController.conformPassword
                                .toggle();
                          },
                          child: createNewPasswordController
                                  .conformPassword.value
                              ? Padding(
                                  padding:
                                      const EdgeInsets.all(SizeFile.height12),
                                  child: Image.asset(
                                      AssetImagePaths.passwordVisible,
                                      height: SizeFile.height12,
                                      width: SizeFile.height15),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.all(SizeFile.height12),
                                  child: Image.asset(
                                      AssetImagePaths.passwordNotVisible,
                                      height: SizeFile.height12,
                                      width: SizeFile.height15),
                                ),
                        )),
                  )),
              const SizedBox(height: SizeFile.height40),
              GestureDetector(
                onTap: () {
                  Get.to(const LoginScreen());
                },
                child: ButtonCommon(
                  text: StringConfig.reset,
                  buttonColor: ColorFile.appColor,
                  textColor: ColorFile.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
