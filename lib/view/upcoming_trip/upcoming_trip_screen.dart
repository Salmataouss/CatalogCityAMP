import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/language_controller.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../controller/home_controller.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';

// ignore: must_be_immutable
class UpcomingTripScreen extends StatefulWidget {
  bool isAppbar;
  UpcomingTripScreen({Key? key, this.isAppbar = false}) : super(key: key);

  @override
  State<UpcomingTripScreen> createState() => _UpcomingTripScreenState();
}

class _UpcomingTripScreenState extends State<UpcomingTripScreen> {
  int upcomingIndex = 0;
  List upcomingList = [StringConfig.upcoming, StringConfig.recent];
  List<Map<String, dynamic>> manaliList = [
    {
      "title": StringConfig.manali,
      "Icon": AssetImagePaths.manaliImage,
      "button": AssetImagePaths.completedButtonImage,
    },
    {
      "title": StringConfig.sanFranciso,
      "Icon": AssetImagePaths.sanFrancisoUpImage,
      "button": AssetImagePaths.cancelledButtonImage,
    },
    {
      "title": StringConfig.monterey,
      "Icon": AssetImagePaths.montereyUpImage,
      "button": AssetImagePaths.cancelledButtonImage,
    },
    {
      "title": StringConfig.manali,
      "Icon": AssetImagePaths.manaliImage,
      "button": AssetImagePaths.completedButtonImage,
    },
    {
      "title": StringConfig.sanFranciso,
      "Icon": AssetImagePaths.sanFrancisoUpImage,
      "button": AssetImagePaths.cancelledButtonImage,
    },
  ];
  final LanguageController languageController = Get.put(LanguageController());
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: widget.isAppbar
          ? null
          : AppBar(
              scrolledUnderElevation: 0.0,
              elevation: 0,
              backgroundColor: ColorFile.whiteColor,
              title: Text(
                  upcomingIndex == 0
                      ? StringConfig.upcomingTrip
                      : StringConfig.recentTrip,
                  style: const TextStyle(
                      decorationColor: ColorFile.onBordingColor,
                      color: ColorFile.onBordingColor,
                      fontFamily: satoshiBold,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeFile.height22)),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SizeFile.height6,
                      top: SizeFile.height20,
                      bottom: SizeFile.height20,
                    ),
                    child: Image.asset(AssetImagePaths.backArrow2,
                        height: SizeFile.height18,
                        width: SizeFile.height18,
                        color: ColorFile.onBordingColor),
                  )),
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.asset(AssetImagePaths.upcomingTripImage,
                height: SizeFile.height202, width: Get.width),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: SizeFile.height180),
                child: Container(
                  width: SizeFile.height270,
                  height: SizeFile.height44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorFile.whiteColor,
                      borderRadius: BorderRadius.circular(SizeFile.height8),
                      border: Border.all(color: ColorFile.verticalDividerColor),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0,
                            color: ColorFile.whiteColor,
                            blurRadius: 0,
                            offset: Offset(0, 0))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                        2,
                        (index) => GestureDetector(
                          onTap: () {
                            upcomingIndex = index;
                            if (index == 0) {
                              homeController.appbarTitle.value =
                                  StringConfig.upcomingTrip;
                            } else {
                              homeController.appbarTitle.value =
                                  StringConfig.recentTrip;
                            }
                            setState(() {});
                          },
                          child: Container(
                            width: SizeFile.height126,
                            height: SizeFile.height36,
                            alignment: Alignment.center,
                            margin:
                                const EdgeInsets.only(left: SizeFile.height5),
                            decoration: BoxDecoration(
                                color: upcomingIndex == index
                                    ? ColorFile.appColor
                                    : ColorFile.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height8),
                                border: Border.all(color: ColorFile.whiteColor),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      color: ColorFile.whiteColor,
                                      blurRadius: 1,
                                      offset: Offset(0, 0))
                                ]),
                            child: Text(upcomingList[index],
                                style: TextStyle(
                                    decorationColor: ColorFile.onBordingColor,
                                    color: upcomingIndex == index
                                        ? ColorFile.whiteColor
                                        : ColorFile.onBordingColor,
                                    fontFamily: satoshiMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeFile.height16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
                itemCount: manaliList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: Get.width,
                    height: SizeFile.height130,
                    margin: const EdgeInsets.only(
                        left: SizeFile.height20,
                        right: SizeFile.height20,
                        bottom: SizeFile.height10,
                        top: SizeFile.height22),
                    decoration: BoxDecoration(
                        color: ColorFile.whiteColor,
                        borderRadius: BorderRadius.circular(SizeFile.height8),
                        border: Border.all(color: ColorFile.whiteColor),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: SizeFile.height3,
                              color: ColorFile.verticalDividerColor,
                              blurRadius: SizeFile.height3,
                              offset: Offset(0, 0))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: SizeFile.height10, left: SizeFile.height10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(manaliList[index]["Icon"],
                              height: SizeFile.height99,
                              width: SizeFile.height90,
                              fit: BoxFit.contain),
                          Expanded(
                              child: Obx(
                            () => Padding(
                              padding: EdgeInsets.only(
                                  left: languageController.arb.value
                                      ? SizeFile.height4
                                      : SizeFile.height8,
                                  right: languageController.arb.value
                                      ? SizeFile.height8
                                      : SizeFile.height4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(manaliList[index]["title"],
                                          style: const TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiMedium,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeFile.height16)),
                                      upcomingIndex == 0
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  AssetImagePaths.calendarIcon,
                                                  height: SizeFile.height8,
                                                  width: SizeFile.height8,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height4),
                                                const Text(
                                                    StringConfig.date16Feb17Feb,
                                                    style: TextStyle(
                                                        decorationColor:
                                                            ColorFile
                                                                .onBordingColor,
                                                        color: ColorFile
                                                            .onBordingColor,
                                                        fontFamily:
                                                            satoshiMedium,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            SizeFile.height12)),
                                              ],
                                            )
                                          : Image.asset(
                                              manaliList[index]["button"],
                                              height: SizeFile.height18,
                                              width: SizeFile.height55,
                                            )
                                    ],
                                  ),
                                  const SizedBox(height: SizeFile.height2),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AssetImagePaths.southeastLogo,
                                        height: SizeFile.height12,
                                        width: SizeFile.height12,
                                      ),
                                      const SizedBox(width: SizeFile.height5),
                                      const Text(StringConfig.southeastAsiaEast,
                                          style: TextStyle(
                                              color: ColorFile.onBording2Color,
                                              fontFamily: satoshiRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height12)),
                                    ],
                                  ),
                                  const SizedBox(height: SizeFile.height2),
                                  Row(
                                    children: const [
                                      Text(StringConfig.time17hrs15Min,
                                          style: TextStyle(
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height10)),
                                      SizedBox(width: SizeFile.height5),
                                      Expanded(
                                          child: Divider(
                                        color: ColorFile.lineColor,
                                        height: SizeFile.height1,
                                        thickness: SizeFile.height1,
                                      ))
                                    ],
                                  ),
                                  const SizedBox(height: SizeFile.height2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(StringConfig.nYC,
                                          style: TextStyle(
                                              color: ColorFile.orContinue,
                                              fontFamily: satoshiRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height12)),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: SizeFile.height42),
                                          child: Center(
                                            child: Text(StringConfig.dXB,
                                                style: TextStyle(
                                                    color: ColorFile.orContinue,
                                                    fontFamily: satoshiRegular,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeFile.height12)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: SizeFile.height42),
                                      child: Image.asset(
                                        AssetImagePaths.circleFlightCircle,
                                        height: SizeFile.height6,
                                        width: SizeFile.height42,
                                      )),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(StringConfig.time11,
                                          style: TextStyle(
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiMedium,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeFile.height12)),
                                      Flexible(
                                        flex: 1,
                                        child: Center(
                                          child: Text(StringConfig.time20,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiMedium,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height12)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: SizeFile.height12),
                                        child: Text(StringConfig.price598,
                                            style: TextStyle(
                                                color: ColorFile.appColor,
                                                fontFamily: satoshiBold,
                                                fontWeight: FontWeight.w700,
                                                fontSize: SizeFile.height15)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
