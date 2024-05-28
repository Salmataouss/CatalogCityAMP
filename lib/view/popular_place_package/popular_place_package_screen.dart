import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../controller/home_controller.dart';
import '../../model/place_model.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../place_details/place_details_screen.dart';
//import '../../controller/home_controller.dart';

class PopularPlacePackageScreen extends StatefulWidget {
  const PopularPlacePackageScreen({Key? key}) : super(key: key);

  @override
  State<PopularPlacePackageScreen> createState() =>
      _PopularPlacePackageScreenState();
}

List imageList = [
  AssetImagePaths.taghazout,
  AssetImagePaths.package2,
  AssetImagePaths.taghazout,
  AssetImagePaths.package2,
];
final homeController = Get.put(HomeController());

class _PopularPlacePackageScreenState extends State<PopularPlacePackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.package,
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
                left: SizeFile.height5,
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
          padding: const EdgeInsets.only(
            left: SizeFile.height20,
            right: SizeFile.height20,
            bottom: SizeFile.height16,
          ),
          child: ListView.builder(
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(PlaceDetailsScreen1(placeDetails: places[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: SizeFile.height16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: Alignment.bottomRight, children: [
                        Image.asset(
                          imageList[index],
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: SizeFile.height98,
                          height: SizeFile.height24,
                          margin: const EdgeInsets.only(
                              right: SizeFile.height10,
                              bottom: SizeFile.height10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorFile.night6DaysButton,
                              borderRadius:
                                  BorderRadius.circular(SizeFile.height3)),
                          child: const Text(StringConfig.night6Days,
                              style: TextStyle(
                                  color: ColorFile.appColor,
                                  fontFamily: satoshiRegular,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height12)),
                        )
                      ]),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: SizeFile.height10),
                        decoration: BoxDecoration(
                            color: ColorFile.whiteColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(SizeFile.height10),
                              bottomRight: Radius.circular(SizeFile.height10),
                            ),
                            border: Border.all(
                                color: ColorFile.verticalDividerColor,
                                width: SizeFile.height1),
                            boxShadow: const [
                              BoxShadow(
                                  color: ColorFile.verticalDividerColor,
                                  offset: Offset(0.0, 0.0))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: SizeFile.height8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  StringConfig.picturesqueHoneymoonSrinagar,
                                  style: TextStyle(
                                      color: ColorFile.onBordingColor,
                                      fontFamily: satoshiBold,
                                      fontWeight: FontWeight.w700,
                                      fontSize: SizeFile.height14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(StringConfig.srinagar1N,
                                      style: TextStyle(
                                          color: ColorFile.onBordingColor,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                  Image.asset(
                                    AssetImagePaths.arrowRight,
                                    height: SizeFile.height12,
                                  ),
                                  const SizedBox(width: SizeFile.height4),
                                  const Text(StringConfig.gulmarg1N,
                                      style: TextStyle(
                                          color: ColorFile.onBordingColor,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                  Image.asset(
                                    AssetImagePaths.arrowRight,
                                    height: SizeFile.height12,
                                  ),
                                  const Text(StringConfig.pahalgam1N,
                                      style: TextStyle(
                                          color: ColorFile.onBordingColor,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                  Image.asset(
                                    AssetImagePaths.arrowRight,
                                    height: SizeFile.height12,
                                  ),
                                  Expanded(
                                    child: const Text(StringConfig.srinagar2N,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height11)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: SizeFile.height8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetImagePaths.homeVertical,
                                          height: SizeFile.height14,
                                          width: SizeFile.height18,
                                        ),
                                        const SizedBox(width: SizeFile.height4),
                                        Flexible(
                                          child: const Text(
                                              StringConfig.twinSharingRooms,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: ColorFile.lineColor,
                                    width: SizeFile.height1_5,
                                    height: SizeFile.height20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                            width: SizeFile.height15),
                                        Image.asset(
                                          AssetImagePaths.careImage,
                                          height: SizeFile.height14,
                                          width: SizeFile.height18,
                                        ),
                                        const SizedBox(width: SizeFile.height4),
                                        Flexible(
                                          child: const Text(
                                              StringConfig.privateCabWithDriver,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: SizeFile.height8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetImagePaths.camera,
                                          height: SizeFile.height14,
                                          width: SizeFile.height18,
                                        ),
                                        const SizedBox(width: SizeFile.height4),
                                        Flexible(
                                          child: const Text(
                                              StringConfig.sightseeingCab,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: ColorFile.lineColor,
                                    width: SizeFile.height1_5,
                                    height: SizeFile.height20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                            width: SizeFile.height15),
                                        Image.asset(
                                          AssetImagePaths.breakFast,
                                          height: SizeFile.height14,
                                          width: SizeFile.height18,
                                        ),
                                        const SizedBox(width: SizeFile.height4),
                                        Flexible(
                                          child: const Text(
                                              StringConfig.breakfastDinner,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: SizeFile.height10),
                              Row(
                                children: [
                                  const Text(StringConfig.$8812,
                                      style: TextStyle(
                                          color: ColorFile.onBordingColor,
                                          fontFamily: satoshiBold,
                                          fontWeight: FontWeight.w500,
                                          fontSize: SizeFile.height16)),
                                  const SizedBox(width: SizeFile.height4),
                                  const Text(StringConfig.$100_25,
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: ColorFile.orContinue,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                  const SizedBox(width: SizeFile.height8),
                                  Container(
                                    height: SizeFile.height18,
                                    width: SizeFile.height46,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: ColorFile.of14button,
                                        borderRadius: BorderRadius.circular(
                                            SizeFile.height3)),
                                    child: const Text(StringConfig.off14,
                                        style: TextStyle(
                                            color: ColorFile.whiteColor,
                                            fontFamily: satoshiMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height11)),
                                  ),
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(PlaceDetailsScreen1(
                                                placeDetails: places[index],
                                              ));
                                            },
                                            child: const Text(
                                                StringConfig.viewDetails,
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        ColorFile.appColor,
                                                    color: ColorFile.appColor,
                                                    fontFamily: satoshiBold,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        SizeFile.height12)),
                                          ),
                                        ]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
