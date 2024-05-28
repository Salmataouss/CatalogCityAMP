import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/sign_up_controller.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/common_button.dart';
import 'package:catalog_city_project/util/font_family.dart';
import 'package:catalog_city_project/util/size_config.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../controller/login_controller.dart';
import '../forgot_password_screen/forgot_password_screen.dart';
import '../home_screen/home_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  bool passwordVisible = false;
  SignUpController signUpController = Get.put(SignUpController());

  @override
  void initState() {
    
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeFile.height35),
                const Text(StringConfig.welcomeBack,
                    style: TextStyle(
                        fontSize: SizeFile.height26,
                        color: ColorFile.onBordingColor,
                        fontFamily: satoshiMedium)),
                const SizedBox(height: SizeFile.height4),
                const Text(StringConfig.pleaseEnterYourDetails,
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
                    } else if (!signUpController.regExp.hasMatch(value)) {
                      return "\u24D8 Invalid email id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorFile.redColor),
                        borderRadius: BorderRadius.circular(
                          SizeFile.height8,
                        ),
                      ),
                      hintText: StringConfig.enterEmail,
                      hintStyle: const TextStyle(
                          fontSize: SizeFile.height14,
                          color: ColorFile.orContinue),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(SizeFile.height12),
                        child: Image.asset(
                          AssetImagePaths.emailIcon,
                          height: SizeFile.height18,
                          width: SizeFile.height18,
                        ),
                      )),
                ),
                const SizedBox(height: SizeFile.height20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: loginController.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u24D8 ${StringConfig.thisFieldIsRequired}";
                    }
                    return null;
                  },
                  obscureText: passwordVisible,
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
                        padding: const EdgeInsets.all(SizeFile.height12),
                        child: Image.asset(
                          AssetImagePaths.passwordLock,
                          height: SizeFile.height18,
                          width: SizeFile.height18,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                        child: passwordVisible
                            ? Padding(
                                padding:
                                    const EdgeInsets.all(SizeFile.height12),
                                child: Image.asset(
                                    AssetImagePaths.passwordNotVisible,
                                    height: SizeFile.height20,
                                    width: SizeFile.height20),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.all(SizeFile.height12),
                                child: Image.asset(
                                    AssetImagePaths.passwordVisible,
                                    height: SizeFile.height20,
                                    width: SizeFile.height20),
                              ),
                      )),
                ),
                const SizedBox(height: SizeFile.height12),
                GestureDetector(
                  onTap: () {
                    Get.to(const ForgotPasswordScreen());
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(StringConfig.forgotPasswordQ,
                            style: TextStyle(
                                fontFamily: satoshiMedium,
                                color: ColorFile.appColor,
                                height: SizeFile.height08,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeFile.height14))
                      ]),
                ),
                const SizedBox(height: SizeFile.height30),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.off(const HomeScreen());
                    }
                  },
                  child: ButtonCommon(
                    text: StringConfig.logIn,
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
                    const Text(StringConfig.orContinueWith,
                        style: TextStyle(
                          color: ColorFile.orContinue,
                          fontFamily: satoshiRegular,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeFile.height12,
                        )),
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
                        width: Get.width / 3,
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
                          width: Get.width / 3,
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
                      StringConfig.donTHaveAnAccount,
                      style: TextStyle(
                          fontFamily: satoshiRegular,
                          fontSize: SizeFile.height14,
                          color: ColorFile.onBording2Color),
                    ),
                    const SizedBox(width: SizeFile.height3),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: const Text(StringConfig.signUp,
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: satoshiBold,
                              fontSize: SizeFile.height16,
                              color: ColorFile.appColor)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
