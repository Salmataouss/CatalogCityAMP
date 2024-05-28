import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/common_button.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import 'congratulation_screen.dart';

class PaymentScreen extends StatefulWidget {
  final String hotel;

  const PaymentScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedOption = 'Mastercard';
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.payment,
            style: TextStyle(
                decorationColor: ColorFile.onBordingColor,
                color: ColorFile.onBordingColor,
                fontFamily: satoshiBold,
                fontWeight: FontWeight.w400,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: SizeFile.height10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: SizeFile.height10),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeFile.height12,
                              right: SizeFile.height20),
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
                        Padding(
                          padding:
                              const EdgeInsets.only(right: SizeFile.height12),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected
                                      ? isSelected = false
                                      : isSelected = true;
                                });
                              },
                              child: Image.asset(
                                isSelected
                                    ? AssetImagePaths.feelCircleIcon
                                    : AssetImagePaths.whiteCircleIcon,
                                height: SizeFile.height16,
                              )),
                        )
                      ],
                    ),
                    const Divider(
                      color: ColorFile.borderColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(StringConfig.nameOnCard,
                              style: TextStyle(
                                fontFamily: satoshiMedium,
                                color: ColorFile.onBordingColor,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeFile.height14,
                              )),
                          const SizedBox(height: SizeFile.height6),
                          Container(
                            height: SizeFile.height48,
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.only(left: SizeFile.height12),
                            decoration: BoxDecoration(
                                color: ColorFile.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height8),
                                border: Border.all(color: ColorFile.whiteColor),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      color: ColorFile.border,
                                      blurRadius: 1,
                                      offset: Offset(0, 0))
                                ]),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: StringConfig.mastercard,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintStyle: TextStyle(
                                    fontSize: SizeFile.height14,
                                    color: ColorFile.orContinue),
                              ),
                            ),
                          ),
                          const SizedBox(height: SizeFile.height16),
                          const Text(StringConfig.cardNumber,
                              style: TextStyle(
                                fontFamily: satoshiMedium,
                                color: ColorFile.onBordingColor,
                                fontWeight: FontWeight.w500,
                                fontSize: SizeFile.height14,
                              )),
                          const SizedBox(height: SizeFile.height6),
                          Container(
                            height: SizeFile.height48,
                            alignment: Alignment.center,
                            padding:
                                const EdgeInsets.only(left: SizeFile.height12),
                            decoration: BoxDecoration(
                                color: ColorFile.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height8),
                                border: Border.all(color: ColorFile.whiteColor),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      color: ColorFile.border,
                                      blurRadius: 1,
                                      offset: Offset(0, 0))
                                ]),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                isDense: true,
                                border: InputBorder.none,
                                hintText: StringConfig.cardNumberText,
                                hintStyle: TextStyle(
                                    fontSize: SizeFile.height14,
                                    color: ColorFile.orContinue),
                              ),
                            ),
                          ),
                          const SizedBox(height: SizeFile.height16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConfig.expireDate,
                                        style: TextStyle(
                                          fontFamily: satoshiMedium,
                                          color: ColorFile.onBordingColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeFile.height14,
                                        )),
                                    const SizedBox(height: SizeFile.height6),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: SizeFile.height46,
                                            width: SizeFile.height48,
                                            decoration: BoxDecoration(
                                                color: ColorFile.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeFile.height8),
                                                border: Border.all(
                                                    color:
                                                        ColorFile.whiteColor),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      spreadRadius: 1,
                                                      color: ColorFile.border,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 0))
                                                ]),
                                            child: TextField(
                                              textAlign: TextAlign.left,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left:
                                                              SizeFile.height12,
                                                          bottom:
                                                              SizeFile.height6),
                                                  border: InputBorder.none,
                                                  hintText: StringConfig.expire,
                                                  hintStyle: TextStyle(
                                                    fontFamily: satoshiRegular,
                                                    color: ColorFile.orContinue,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: SizeFile.height12,
                                                  )),
                                            )),
                                        SizedBox(width: SizeFile.height10),
                                        Container(
                                            height: SizeFile.height46,
                                            width: SizeFile.height48,
                                            // alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: ColorFile.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeFile.height8),
                                                border: Border.all(
                                                    color:
                                                        ColorFile.whiteColor),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      spreadRadius: 1,
                                                      color: ColorFile.border,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 0))
                                                ]),
                                            child: TextField(
                                              textAlign: TextAlign.left,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left:
                                                              SizeFile.height12,
                                                          bottom:
                                                              SizeFile.height6),
                                                  border: InputBorder.none,
                                                  hintText: StringConfig
                                                      .expireDateText,
                                                  hintStyle: TextStyle(
                                                    fontFamily: satoshiRegular,
                                                    color: ColorFile.orContinue,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: SizeFile.height12,
                                                  )),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConfig.cVV,
                                        style: TextStyle(
                                          fontFamily: satoshiMedium,
                                          color: ColorFile.onBordingColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeFile.height14,
                                        )),
                                    const SizedBox(height: SizeFile.height6),
                                    Container(
                                        height: SizeFile.height46,
                                        width: Get.width / 2.47,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: ColorFile.whiteColor,
                                            borderRadius: BorderRadius.circular(
                                                SizeFile.height8),
                                            border: Border.all(
                                                color: ColorFile.whiteColor),
                                            boxShadow: const [
                                              BoxShadow(
                                                  spreadRadius: 1,
                                                  color: ColorFile.border,
                                                  blurRadius: 1,
                                                  offset: Offset(0, 0))
                                            ]),
                                        child: TextField(
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(

                                              border: InputBorder.none,
                                              hintText: StringConfig.cvvText,
                                              contentPadding: EdgeInsets.only(
                                                  left: SizeFile.height12,right: SizeFile.height12,
                                                  bottom: SizeFile.height6),
                                              hintStyle: TextStyle(
                                                fontFamily: satoshiRegular,
                                                color: ColorFile.orContinue,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeFile.height12,
                                              )),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
                          left: SizeFile.height12, right: SizeFile.height33),
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
                    Radio(
                        value: StringConfig.netBanking,
                        groupValue: selectedOption,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorFile.appColor),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        })
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
                          left: SizeFile.height12, right: SizeFile.height15),
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
                    Radio(
                        value: StringConfig.uPIPayment,
                        groupValue: selectedOption,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorFile.appColor),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        })
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
                    Radio(
                        value: StringConfig.wallet,
                        groupValue: selectedOption,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorFile.appColor),
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(height: SizeFile.height50),
              Column(
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
                  const SizedBox(height: SizeFile.height16),
                  GestureDetector(
                    onTap: () {
                      Get.to(CongratulationScreen(
                        hotel: widget.hotel,
                      ));
                    },
                    child: ButtonCommon(
                      text: StringConfig.payNow,
                      buttonColor: ColorFile.appColor,
                      textColor: ColorFile.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeFile.height16),
            ],
          ),
        ),
      ),
    );
  }
}
