import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/view/payment_details/payment_screen.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/common_button.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';

// ignore: must_be_immutable
class SelectYourPaymentScreen extends StatefulWidget {
  final String flight;
  const SelectYourPaymentScreen({Key? key, required this.flight})
      : super(key: key);

  @override
  State<SelectYourPaymentScreen> createState() =>
      _SelectYourPaymentScreenState();
}

class _SelectYourPaymentScreenState extends State<SelectYourPaymentScreen> {
  String selectedOption = 'Mastercard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.selectYourPayment,
            style: TextStyle(
                decorationColor: ColorFile.onBordingColor,
                color: ColorFile.onBordingColor,
                fontFamily: satoshiMedium,
                fontWeight: FontWeight.w500,
                fontSize: SizeFile.height22)),
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
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: SizeFile.height10),
            Container(
              height: SizeFile.height56,
              decoration: BoxDecoration(
                  color: ColorFile.whiteColor,
                  borderRadius: BorderRadius.circular(SizeFile.height8),
                  border: Border.all(color: ColorFile.whiteColor),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        color: ColorFile.border,
                        blurRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeFile.height12, right: SizeFile.height24),
                    child: Image.asset(
                      AssetImagePaths.visaIcon,
                      height: SizeFile.height13,
                      width: SizeFile.height36,
                    ),
                  ),
                  const Text(StringConfig.creditDebitCard,
                      style: TextStyle(
                        fontFamily: satoshiMedium,
                        color: ColorFile.onBordingColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeFile.height16,
                      )),
                  const Spacer(),
                  Theme(
                    data:
                        ThemeData(unselectedWidgetColor: ColorFile.orContinue),
                    child: Radio(
                        value: StringConfig.creditDebitCard,
                        groupValue: selectedOption,
                        activeColor: ColorFile.appColor,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: SizeFile.height16),
            Container(
              height: SizeFile.height56,
              decoration: BoxDecoration(
                  color: ColorFile.whiteColor,
                  borderRadius: BorderRadius.circular(SizeFile.height8),
                  border: Border.all(color: ColorFile.whiteColor),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        color: ColorFile.border,
                        blurRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeFile.height12, right: SizeFile.height36),
                    child: Image.asset(
                      AssetImagePaths.netBankingIcon,
                      height: SizeFile.height27,
                      width: SizeFile.height26,
                    ),
                  ),
                  const Text(StringConfig.netBanking,
                      style: TextStyle(
                        fontFamily: satoshiMedium,
                        color: ColorFile.onBordingColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeFile.height16,
                      )),
                  const Spacer(),
                  Theme(
                    data:
                        ThemeData(unselectedWidgetColor: ColorFile.orContinue),
                    child: Radio(
                        value: StringConfig.netBanking,
                        groupValue: selectedOption,
                        activeColor: ColorFile.appColor,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: SizeFile.height16),
            Container(
              height: SizeFile.height56,
              decoration: BoxDecoration(
                  color: ColorFile.whiteColor,
                  borderRadius: BorderRadius.circular(SizeFile.height8),
                  border: Border.all(color: ColorFile.whiteColor),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        color: ColorFile.border,
                        blurRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeFile.height12, right: SizeFile.height16),
                    child: Image.asset(
                      AssetImagePaths.upiPaymentIcon,
                      height: SizeFile.height12,
                      width: SizeFile.height45,
                    ),
                  ),
                  const Text(StringConfig.uPIPayment,
                      style: TextStyle(
                        fontFamily: satoshiMedium,
                        color: ColorFile.onBordingColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeFile.height16,
                      )),
                  const Spacer(),
                  Theme(
                    data:
                        ThemeData(unselectedWidgetColor: ColorFile.orContinue),
                    child: Radio(
                        value: StringConfig.uPIPayment,
                        groupValue: selectedOption,
                        activeColor: ColorFile.appColor,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(height: SizeFile.height16),
            Container(
              height: SizeFile.height56,
              decoration: BoxDecoration(
                  color: ColorFile.whiteColor,
                  borderRadius: BorderRadius.circular(SizeFile.height8),
                  border: Border.all(color: ColorFile.whiteColor),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        color: ColorFile.border,
                        blurRadius: 1,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SizeFile.height12, right: SizeFile.height32),
                    child: Image.asset(
                      AssetImagePaths.walletIcon,
                      height: SizeFile.height20,
                      width: SizeFile.height28,
                    ),
                  ),
                  const Text(StringConfig.wallet,
                      style: TextStyle(
                        fontFamily: satoshiMedium,
                        color: ColorFile.onBordingColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeFile.height16,
                      )),
                  const Spacer(),
                  Theme(
                    data:
                        ThemeData(unselectedWidgetColor: ColorFile.orContinue),
                    child: Radio(
                        value: StringConfig.wallet,
                        groupValue: selectedOption,
                        activeColor: ColorFile.appColor,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(StringConfig.srinagarBooking,
                          style: TextStyle(
                            fontFamily: satoshiRegular,
                            color: ColorFile.onBording2Color,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeFile.height14,
                          )),
                      SizedBox(
                        width: SizeFile.height55,
                        child: Text(StringConfig.$2860,
                            style: TextStyle(
                              fontFamily: satoshiRegular,
                              color: ColorFile.onBordingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height14,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeFile.height8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(StringConfig.tax,
                          style: TextStyle(
                            fontFamily: satoshiRegular,
                            color: ColorFile.onBording2Color,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeFile.height16,
                          )),
                      SizedBox(
                        width: SizeFile.height55,
                        child: Text(StringConfig.$0,
                            style: TextStyle(
                              fontFamily: satoshiRegular,
                              color: ColorFile.onBordingColor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height14,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeFile.height8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(StringConfig.discountCoupon,
                          style: TextStyle(
                            fontFamily: satoshiRegular,
                            color: ColorFile.onBording2Color,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeFile.height16,
                          )),
                      SizedBox(
                        width: SizeFile.height55,
                        child: Text(StringConfig.$0,
                            style: TextStyle(
                              fontFamily: satoshiRegular,
                              color: ColorFile.onBordingColor,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeFile.height14,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeFile.height8),
                  Divider(
                    color: ColorFile.appColor.withOpacity(0.15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(StringConfig.total,
                          style: TextStyle(
                            fontFamily: satoshiBold,
                            color: ColorFile.appColor,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeFile.height16,
                          )),
                      SizedBox(
                        width: SizeFile.height55,
                        child: Text(StringConfig.$2860,
                            style: TextStyle(
                              fontFamily: satoshiBold,
                              color: ColorFile.appColor,
                              fontWeight: FontWeight.w700,
                              fontSize: SizeFile.height14,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeFile.height25),
                  GestureDetector(
                    onTap: () {
                      Get.to(PaymentScreen(hotel: widget.flight));
                    },
                    child: ButtonCommon(
                      text: StringConfig.payment,
                      buttonColor: ColorFile.appColor,
                      textColor: ColorFile.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SizeFile.height16),
          ],
        ),
      ),
    );
  }
}
