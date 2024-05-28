import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List showingResultList = [
    StringConfig.hotelAndHomestays,
    StringConfig.coupleFriendlyHotel,
    StringConfig.restau,
    StringConfig.flightFromDubai,
    StringConfig.hotel,
    StringConfig.hotelAndHomestays,
    StringConfig.flightFromDubai,
  ];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SizeFile.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.33,
                    height: SizeFile.height38,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      controller: searchController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.only(
                              top: SizeFile.height12,
                              bottom: SizeFile.height10,
                              left: SizeFile.height10,
                              right: SizeFile.height10),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(SizeFile.height8)),
                          hintText: StringConfig.raisonBeach,
                          hintStyle: const TextStyle(
                              fontSize: SizeFile.height14,
                              color: ColorFile.orContinue),
                          suffixIcon: searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      searchController.clear();
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: ColorFile.onBordingColor,
                                    size: SizeFile.height16,
                                  ))
                              : null),
                    ),
                  ),
                  Spacer(),
                  Container(
                      width: SizeFile.height42,
                      height: SizeFile.height38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeFile.height10),
                          border: Border.all(
                              width: SizeFile.height1,
                              color: ColorFile.borderColor),
                          color: ColorFile.whiteColor),
                      child: Image.asset(
                        AssetImagePaths.voiceIcon,
                        color: ColorFile.blackColor,
                        height: SizeFile.height18,
                        width: SizeFile.height18,
                      )),
                ],
              ),
              const SizedBox(height: SizeFile.height24),
              RichText(
                text: const TextSpan(
                  text: StringConfig.showingResult,
                  style: TextStyle(
                      decorationColor: ColorFile.onBordingColor,
                      color: ColorFile.onBordingColor,
                      fontFamily: satoshiBold,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeFile.height18),
                  children: [
                    TextSpan(
                      text: StringConfig.raisonBeachI,
                      style: TextStyle(
                          decorationColor: ColorFile.onBordingColor,
                          color: ColorFile.orContinue,
                          fontFamily: satoshiRegular,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeFile.height18),
                    )
                  ],
                ),
              ),
              const SizedBox(height: SizeFile.height16),
              ListView.builder(
                  itemCount: showingResultList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: StringConfig.mumbai,
                                style: const TextStyle(
                                    decorationColor: ColorFile.onBordingColor,
                                    color: ColorFile.orContinue,
                                    fontFamily: satoshiRegular,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeFile.height14),
                                children: [
                                  TextSpan(
                                    text: showingResultList[index],
                                    style: const TextStyle(
                                        decorationColor:
                                            ColorFile.onBordingColor,
                                        color: ColorFile.onBordingColor,
                                        fontFamily: satoshiBold,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeFile.height14),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              AssetImagePaths.forwordArrow,
                              height: SizeFile.height10,
                            )
                          ],
                        ),
                        Container(
                          height: SizeFile.height1,
                          width: Get.width,
                          margin: const EdgeInsets.only(
                              top: SizeFile.height16,
                              bottom: SizeFile.height12),
                          color: ColorFile.border,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
