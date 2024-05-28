import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/sign_up_controller.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/font_family.dart';
import 'package:catalog_city_project/util/size_config.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../controller/login_controller.dart';
import '../../util/common_button.dart';
import '../login_screem/login_screen.dart';
import '../otp_screen/otp_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
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
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: SizeFile.height10),
                const Text(StringConfig.createANewAccount,
                    style: TextStyle(
                        fontSize: SizeFile.height26,
                        color: ColorFile.onBordingColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: satoshiMedium)),
                const SizedBox(height: SizeFile.height4),
                const Text(StringConfig.pleaseEnterYourDetailsAndJoin,
                    style: TextStyle(
                        fontSize: SizeFile.height14,
                        color: ColorFile.onBording2Color,
                        fontFamily: satoshiRegular)),
                const SizedBox(height: SizeFile.height30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u24D8 ${StringConfig.thisFieldIsRequired}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeFile.height8)),
                      hintText: StringConfig.enterName,
                      hintStyle: const TextStyle(
                          fontSize: SizeFile.height14,
                          color: ColorFile.orContinue),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(SizeFile.height12),
                        child: Image.asset(AssetImagePaths.userRounded,
                            height: SizeFile.height19,
                            width: SizeFile.height20),
                      )),
                ),
                const SizedBox(height: SizeFile.height20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u24D8 ${StringConfig.thisFieldIsRequired}";
                    } else if (!signUpController.regExp.hasMatch(value)) {
                      return "\u24D8 ${StringConfig.invalidEmail}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeFile.height8)),
                      hintText: StringConfig.enterEmail,
                      hintStyle: const TextStyle(
                          fontSize: SizeFile.height14,
                          color: ColorFile.orContinue),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(SizeFile.height12),
                        child: Image.asset(
                          AssetImagePaths.emailIcon,
                          height: SizeFile.height12,
                          width: SizeFile.height15,
                        ),
                      )),
                ),
                const SizedBox(height: SizeFile.height20),
                Obx(() => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "\u24D8 ${StringConfig.thisFieldIsRequired}";
                        }
                        return null;
                      },
                      controller: signUpController.passwordController,
                      obscureText: !loginController.signPasswordVisible.value,
                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeFile.height8)),
                          hintText: StringConfig.enterPassword,
                          hintStyle: const TextStyle(
                              fontSize: SizeFile.height14,
                              color: ColorFile.orContinue),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(
                              SizeFile.height12,
                            ),
                            child: Image.asset(
                              AssetImagePaths.passwordLock,
                              height: SizeFile.height18,
                              width: SizeFile.height18,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              loginController.signPasswordVisible.toggle();
                            },
                            child: loginController.signPasswordVisible.value
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "\u24D8 ${StringConfig.thisFieldIsRequired}";
                        } else if (value !=
                            signUpController.passwordController.text) {
                          return "\u24D8 ${StringConfig.passwordNotMatch}";
                        }
                        return null;
                      },
                      obscureText:
                          !loginController.signConFormPasswordVisible.value,
                      decoration: InputDecoration(
                          isDense: true,
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
                              height: SizeFile.height10,
                              width: SizeFile.height13,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              loginController.signConFormPasswordVisible
                                  .toggle();
                            },
                            child: loginController
                                    .signConFormPasswordVisible.value
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
                const SizedBox(height: SizeFile.height12),
                const SizedBox(height: SizeFile.height30),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(OtpScreen());
                    }
                  },
                  child: ButtonCommon(
                    text: StringConfig.signUp,
                    buttonColor: ColorFile.appColor,
                    textColor: ColorFile.whiteColor,
                  ),
                ),
                const SizedBox(height: SizeFile.height24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeFile.height1,
                      width: SizeFile.height100,
                      color: ColorFile.lineColor,
                    ),
                    const SizedBox(width: SizeFile.height10),
                    const Text(
                      StringConfig.orContinueWith,
                      style: TextStyle(
                        color: ColorFile.orContinue,
                        fontFamily: satoshiRegular,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeFile.height12,
                      ),
                    ),
                    const SizedBox(width: SizeFile.height10),
                    Container(
                      height: SizeFile.height1,
                      width: SizeFile.height100,
                      color: ColorFile.lineColor,
                    ),
                    // Image.asset(AssetImagePaths.line),
                  ],
                ),
                const SizedBox(height: SizeFile.height24),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SizeFile.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeFile.height44,
                        width: SizeFile.height131,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(SizeFile.size9),
                            color: ColorFile.whiteColor,
                            border:
                                Border.all(color: ColorFile.googleBorderLogo)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetImagePaths.googleLogo,
                              height: SizeFile.height24,
                              width: SizeFile.height24,
                            ),
                            const SizedBox(width: SizeFile.height10),
                            const Text(StringConfig.google,
                                style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiRegular,
                                  fontSize: SizeFile.height14,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(width: SizeFile.height20),
                      Container(
                          height: SizeFile.height44,
                          width: SizeFile.height131,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SizeFile.size9),
                              color: ColorFile.whiteColor,
                              border: Border.all(
                                  color: ColorFile.googleBorderLogo)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetImagePaths.facebook,
                                height: SizeFile.height24,
                                width: SizeFile.height24,
                              ),
                              const SizedBox(width: SizeFile.height10),
                              const Text(StringConfig.facebook,
                                  style: TextStyle(
                                    color: ColorFile.onBordingColor,
                                    fontFamily: satoshiRegular,
                                    fontSize: SizeFile.height14,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: SizeFile.height30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConfig.alreadyAMember,
                      style: TextStyle(
                          fontFamily: satoshiRegular,
                          fontSize: SizeFile.height14,
                          color: ColorFile.onBording2Color),
                    ),
                    const SizedBox(width: SizeFile.height5),
                    GestureDetector(
                      onTap: () {
                        Get.to(const LoginScreen());
                      },
                      child: const Text(StringConfig.logIn,
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: satoshiBold,
                              fontSize: SizeFile.height16,
                              color: ColorFile.appColor)),
                    )
                  ],
                ),
                const SizedBox(height: SizeFile.height10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
