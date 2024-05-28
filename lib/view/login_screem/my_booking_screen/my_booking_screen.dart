import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/language_controller.dart';
import 'package:catalog_city_project/model/place_details.dart';
import '../../../util/asset_image_paths.dart';
import '../../../util/colors.dart';
import '../../../util/font_family.dart';
import '../../../util/size_config.dart';
import '../../../util/string_config.dart';
import 'popular_hotels_screen.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  int currentIndex = 0;
  List<PlaceDetails> myBo0kingList = [
    PlaceDetails(
        placeName: StringConfig.manali,
        icon: AssetImagePaths.manaliImage,
        image: AssetImagePaths.completedButtonImage),
    PlaceDetails(
        placeName: StringConfig.sanFranciso,
        icon: AssetImagePaths.sanFrancisoUpImage,
        image: AssetImagePaths.calender16FebImage),
    PlaceDetails(
        placeName: StringConfig.monterey,
        icon: AssetImagePaths.montereyUpImage,
        image: AssetImagePaths.cancelledButtonImage),
    PlaceDetails(
        placeName: StringConfig.lockinge,
        icon: AssetImagePaths.manaliImage,
        image: AssetImagePaths.completedButtonImage),
    PlaceDetails(
        placeName: StringConfig.sanFranciso,
        icon: AssetImagePaths.sanFrancisoUpImage,
        image: AssetImagePaths.cancelledButtonImage),
  ];
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    languageController.loadSelectedLanguage();
    return Scaffold(
        backgroundColor: ColorFile.whiteColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: ColorFile.whiteColor,
          elevation: 0,
          title: const Text(StringConfig.myBooking,
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
                  left: SizeFile.height6,
                  top: SizeFile.height20,
                  bottom: SizeFile.height20,
                ),
                child: Image.asset(AssetImagePaths.backArrow2,
                    height: SizeFile.height40,
                    width: SizeFile.height40,
                    color: ColorFile.onBordingColor),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: SizeFile.height20),
              child: Column(
                children: [
                  const SizedBox(height: SizeFile.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(PopularHotelsScreen());
                            },
                            child: Image.asset(
                              AssetImagePaths.hotelImage,
                              height: SizeFile.height56,
                            ),
                          ),
                          Text(StringConfig.hotel,
                              style: TextStyle(
                                  decorationColor: ColorFile.onBordingColor,
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Get.to(TrainScreen());
                            },
                            child: Image.asset(
                              AssetImagePaths.trainImage,
                              height: SizeFile.height56,
                            ),
                          ),
                          Text(StringConfig.train,
                              style: TextStyle(
                                  decorationColor: ColorFile.onBordingColor,
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Get.to(CarScreen());
                            },
                            child: Image.asset(
                              AssetImagePaths.carImage,
                              height: SizeFile.height56,
                            ),
                          ),
                          Text(StringConfig.car,
                              style: TextStyle(
                                  decorationColor: ColorFile.onBordingColor,
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.to(FlightScreen());
                            },
                            child: Image.asset(
                              AssetImagePaths.flightImage,
                              height: SizeFile.height56,
                            ),
                          ),
                          Text(StringConfig.flight,
                              style: TextStyle(
                                  decorationColor: ColorFile.onBordingColor,
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Get.to(BusScreen());
                            },
                            child: Image.asset(
                              AssetImagePaths.busImage,
                              height: SizeFile.height56,
                            ),
                          ),
                          Text(StringConfig.bus,
                              style: TextStyle(
                                  decorationColor: ColorFile.onBordingColor,
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeFile.height32),
                  ListView.builder(
                      itemCount: myBo0kingList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                bottom: SizeFile.height10),
                            decoration: BoxDecoration(
                                color: ColorFile.whiteColor,
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height8),
                                border: Border.all(color: ColorFile.border),
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      color: ColorFile.whiteColor,
                                      blurRadius: 1,
                                      offset: Offset(0, 0))
                                ]),
                            child: Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                    right: languageController.arb.value
                                        ? SizeFile.height10
                                        : 0,
                                    top: SizeFile.height10,
                                    left: languageController.arb.value
                                        ? 0
                                        : SizeFile.height10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(myBo0kingList[index].icon!,
                                        height: SizeFile.height99,
                                        width: SizeFile.height90,
                                        fit: BoxFit.contain),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: SizeFile.height8,
                                            right: SizeFile.height8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    myBo0kingList[index]
                                                        .placeName!,
                                                    style: const TextStyle(
                                                        decorationColor:
                                                            ColorFile
                                                                .onBordingColor,
                                                        color: ColorFile
                                                            .onBordingColor,
                                                        fontFamily:
                                                            satoshiMedium,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            SizeFile.height16)),
                                                index == 1
                                                    ? Row(
                                                        children: [
                                                          Image.asset(
                                                              AssetImagePaths
                                                                  .calendarIcon,
                                                              height: SizeFile
                                                                  .height10,
                                                              width: SizeFile
                                                                  .height10),
                                                          SizedBox(
                                                              width: SizeFile
                                                                  .height2),
                                                          Text(
                                                              StringConfig
                                                                  .date16Feb17Feb,
                                                              style: TextStyle(
                                                                  color: ColorFile
                                                                      .onBording2Color,
                                                                  fontFamily:
                                                                      satoshiMedium,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: SizeFile
                                                                      .height11)),
                                                        ],
                                                      )
                                                    : Image.asset(
                                                        myBo0kingList[index]
                                                            .image!,
                                                        height:
                                                            SizeFile.height20,
                                                        width:
                                                            SizeFile.height70)
                                              ],
                                            ),
                                            const SizedBox(
                                                height: SizeFile.height2),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AssetImagePaths.southeastLogo,
                                                  height: SizeFile.height12,
                                                  width: SizeFile.height12,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height5),
                                                const Text(
                                                    StringConfig
                                                        .southeastAsiaEast,
                                                    style: TextStyle(
                                                        color: ColorFile
                                                            .onBording2Color,
                                                        fontFamily:
                                                            satoshiRegular,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            SizeFile.height12)),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: SizeFile.height2),
                                            const Text(
                                                StringConfig.time17hrs15Min,
                                                style: TextStyle(
                                                    color: ColorFile
                                                        .onBordingColor,
                                                    fontFamily: satoshiRegular,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeFile.height10)),
                                            const SizedBox(
                                                height: SizeFile.height2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: const [
                                                Text(StringConfig.nYC,
                                                    style: TextStyle(
                                                        color: ColorFile
                                                            .orContinue,
                                                        fontFamily:
                                                            satoshiRegular,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            SizeFile.height12)),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            SizeFile.height42),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                          StringConfig.dXB,
                                                          style: TextStyle(
                                                              color: ColorFile
                                                                  .orContinue,
                                                              fontFamily:
                                                                  satoshiRegular,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: SizeFile
                                                                  .height12)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: SizeFile.height42),
                                                child: Image.asset(
                                                  AssetImagePaths
                                                      .circleFlightCircle,
                                                  height: SizeFile.height6,
                                                  width: SizeFile.height42,
                                                )),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Text(StringConfig.time11,
                                                    style: TextStyle(
                                                        color: ColorFile
                                                            .onBordingColor,
                                                        fontFamily:
                                                            satoshiMedium,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            SizeFile.height12)),
                                                Text(StringConfig.time20,
                                                    style: TextStyle(
                                                        color: ColorFile
                                                            .onBordingColor,
                                                        fontFamily:
                                                            satoshiMedium,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            SizeFile.height12)),
                                                Text(StringConfig.price598,
                                                    style: TextStyle(
                                                        color:
                                                            ColorFile.appColor,
                                                        fontFamily: satoshiBold,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            SizeFile.height15)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      })
                ],
              )),
        ));
  }
}
