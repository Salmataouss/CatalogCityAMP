import 'dart:io';

import 'package:catalog_city_project/controller/attraction_controller.dart';
import 'package:catalog_city_project/controller/date_person_picker_controller.dart';
import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/size_config.dart';
import 'package:catalog_city_project/util/string_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../../controller/video_controller.dart';
import '../../util/common_button.dart';
import '../../util/font_family.dart';

import '../payment_details/select_your_payment_screen.dart';
import '../place_details/bottom_date_picker.dart';
import '../place_details/rating_review_screen.dart';

class AttractionDetailsScreen extends StatefulWidget {
  const AttractionDetailsScreen({Key? key, required this.attraction})
      : super(key: key);
  final Attraction attraction;

  @override
  State<AttractionDetailsScreen> createState() =>
      _AttractionDetailsScreenState();
}

class _AttractionDetailsScreenState extends State<AttractionDetailsScreen> {
  final AttractionController attractionController =
      Get.put(AttractionController());
  final DatePersonPickerController datePersonPickerController =
      Get.put(DatePersonPickerController());

  VideoController videoController = Get.find();

  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    attractionController.setImages(widget.attraction);
    debugPrint(attractionController.mediaList.toString());
    if (widget.attraction.video != null) {
      _controller = VideoPlayerController.asset(widget.attraction.video!);
      _controller.initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> reviewerList = [
    {
      "title": StringConfig.wadeWarren,
      "Icon": AssetImagePaths.wadeWarrenImage,
      "Date": StringConfig.toDay
    },
    {
      "title": StringConfig.ralphEdwards,
      "Icon": AssetImagePaths.ralphImage,
      "Date": StringConfig.yesterday
    },
    {
      "title": StringConfig.devonLane,
      "Icon": AssetImagePaths.devonImage,
      "Date": StringConfig.date10072022
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorFile.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      height: 500,
                      child: GetBuilder<AttractionController>(builder: (c) {
                        return displayMedia(
                            c.mediaList[c.selectedImage], _controller);
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SizeFile.height20,
                          right: SizeFile.height20,
                          top: SizeFile.height20,
                          bottom: SizeFile.height30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Image.asset(
                              AssetImagePaths.backArrow2,
                              height: SizeFile.height18,
                              width: SizeFile.height18,
                              color: ColorFile.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final dir = await getTemporaryDirectory();
                              final byte = (await rootBundle
                                      .load(widget.attraction.images[0]))
                                  .buffer
                                  .asUint8List(); // convert in to Uint8List
                              final file = File(
                                  "${dir.path}/image.jpg"); // import 'dart:io'
                              await file.writeAsBytes(byte);
                              // Share
                              await Share.shareXFiles([XFile(file.path)],
                                  text:
                                      'Hi look at this cool attraction in ${widget.attraction.title}');
                            },
                            child: Image.asset(
                              AssetImagePaths.circleShareIcon,
                              color: ColorFile.whiteColor,
                              height: SizeFile.height36,
                              width: SizeFile.height36,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeFile.height200),
                        ListView.builder(
                            itemCount: attractionController.mediaList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        attractionController.selectedImage ==
                                                index
                                            ? SizeFile.height20
                                            : SizeFile.height26),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: GetBuilder<AttractionController>(
                                    builder: (c) => GestureDetector(
                                      onTap: () {
                                        c.updateSelectedImage(index);
                                        _controller.pause();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: SizeFile.height7),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 1.5),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(SizeFile.height6),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(SizeFile.height6),
                                            ),
                                            child: Image.asset(
                                              c.mediaList[index]
                                                      .endsWith('.mp4')
                                                  ? AssetImagePaths.playbutton
                                                  : c.mediaList[index],
                                              fit: BoxFit.cover,
                                              width: attractionController
                                                          .selectedImage ==
                                                      index
                                                  ? SizeFile.height60
                                                  : SizeFile.height40,
                                              height: attractionController
                                                          .selectedImage ==
                                                      index
                                                  ? SizeFile.height45
                                                  : SizeFile.height30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: SizeFile.height20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: SizeFile.height16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 2 / 3,
                            child: Text(widget.attraction.title,
                                style: TextStyle(
                                    color: ColorFile.onBordingColor,
                                    fontFamily: satoshiMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeFile.height26)),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (c) => GestureDetector(
                                onTap: () {
                                  c.toggleFavouriteAttraction(
                                      widget.attraction);
                                  c.updateList();
                                },
                                child: Image.asset(
                                  widget.attraction.isFavourite
                                      ? AssetImagePaths.redHeard
                                      : AssetImagePaths.heartCircle,
                                  height: SizeFile.height26,
                                  width: SizeFile.height26,
                                )),
                          )
                        ],
                      ),
                      const SizedBox(height: SizeFile.height16),
                      Row(
                        children: [
                          const Text("\$88.12",
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiBold,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height16)),
                          const SizedBox(width: SizeFile.height4),
                          const Text("\$100.25",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
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
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height3)),
                            child: const Text(StringConfig.off14,
                                style: TextStyle(
                                    color: ColorFile.whiteColor,
                                    fontFamily: satoshiMedium,
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeFile.height11)),
                          ),
                        ],
                      ),
                      const SizedBox(height: SizeFile.height16),
                      ReadMoreText(
                        widget.attraction.description,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: TextStyle(
                            color: ColorFile.onBordingColor,
                            fontFamily: satoshiRegular,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeFile.height13),
                        moreStyle: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: SizeFile.height16),
                      const Text(StringConfig.dateOfTravelGuests,
                          style: TextStyle(
                              color: ColorFile.onBordingColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height16)),
                      const SizedBox(height: SizeFile.height20),
                      Container(
                        width: Get.width,
                        // height: SizeFile.height70,
                        padding:
                            EdgeInsets.symmetric(vertical: SizeFile.height8),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeFile.height6),
                            color: ColorFile.whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: ColorFile.appSubText)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: SizeFile.height12),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(BottomDatePicker());
                              },
                              child: Image.asset(AssetImagePaths.calendarIcon,
                                  height: SizeFile.height15,
                                  width: SizeFile.height15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(BottomDatePicker());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: SizeFile.height8,
                                    left: SizeFile.height8),
                                child: Obx(
                                  () => Text(
                                      datePersonPickerController.date.value,
                                      style: TextStyle(
                                          color: ColorFile.onBordingColor,
                                          fontFamily: satoshiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height15)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeFile.height12),
                              child: VerticalDivider(
                                color: ColorFile.verticalDividerColor,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeFile.height20),
                              child: Image.asset(
                                AssetImagePaths.userRounded,
                                height: SizeFile.height18,
                                width: SizeFile.height18,
                                color: ColorFile.appColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                datePersonPickerController
                                    .roomBottomSheet(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: SizeFile.height8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                          '${datePersonPickerController.getSum()} Person',
                                          style: TextStyle(
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiBold,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height15)),
                                    ),
                                    SizedBox(
                                      height: SizeFile.height5,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: SizeFile.height30),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(SelectYourPaymentScreen(flight: "Flight"));
                          },
                          child: ButtonCommon(
                            text: StringConfig.bookNow,
                            buttonColor: ColorFile.appColor,
                            textColor: ColorFile.whiteColor,
                          ),
                        ),
                      ),
                      Container(
                          width: Get.width,
                          padding: EdgeInsets.all(SizeFile.height8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(SizeFile.height6),
                              color: ColorFile.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: SizeFile.height2,
                                    spreadRadius: SizeFile.height2,
                                    color: ColorFile.appSubText)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetImagePaths.mapImage,
                                        height: SizeFile.height56,
                                        width: SizeFile.height56,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: SizeFile.height8,
                                            left: SizeFile.height8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.attraction.address,
                                                style: TextStyle(
                                                    color: ColorFile
                                                        .onBording2Color,
                                                    fontFamily: satoshiRegular,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeFile.height14)),
                                            GestureDetector(
                                              onTap: () async {
                                                final availableMaps =
                                                    await MapLauncher
                                                        .installedMaps;
                                                availableMaps[0].showMarker(
                                                  coords: Coords(
                                                      37.4220041, -122.0862462),
                                                  title: StringConfig.google,
                                                  description:
                                                      StringConfig.googlePlex,
                                                );
                                              },
                                              child: Text(
                                                  StringConfig.viewOnMap,
                                                  style: TextStyle(
                                                      color: ColorFile.appColor,
                                                      fontFamily: satoshiBold,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize:
                                                          SizeFile.height13)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: SizeFile.height20),
                      const Text(StringConfig.reviewer,
                          style: TextStyle(
                              color: ColorFile.onBordingColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height16)),
                      const SizedBox(height: SizeFile.height15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AssetImagePaths.wadeWarrenImage,
                                height: SizeFile.height50,
                                width: SizeFile.height50,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: SizeFile.height20,
                                      left: SizeFile.height20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(StringConfig.wadeWarren,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiMedium,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                          Text(StringConfig.toDay,
                                              style: TextStyle(
                                                  color: ColorFile.orContinue,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height11)),
                                        ],
                                      ),
                                      const SizedBox(height: SizeFile.height8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starIcon,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: SizeFile.height15),
                          const Text(StringConfig.goodHotelWorthEveryPenny,
                              style: TextStyle(
                                  color: ColorFile.rangeColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height14)),
                          const SizedBox(height: SizeFile.height3),
                          Container(
                            width: Get.width,
                            margin:
                                const EdgeInsets.only(top: SizeFile.height10),
                            height: SizeFile.height1,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height15)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AssetImagePaths.ralphImage,
                                height: SizeFile.height50,
                                width: SizeFile.height50,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: SizeFile.height20,
                                      left: SizeFile.height20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(StringConfig.ralphEdwards,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiMedium,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                          Text(StringConfig.toDay,
                                              style: TextStyle(
                                                  color: ColorFile.orContinue,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height11)),
                                        ],
                                      ),
                                      const SizedBox(height: SizeFile.height8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starIcon,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: SizeFile.height15),
                          const Text(StringConfig.goodHotelWorthEveryPenny,
                              style: TextStyle(
                                  color: ColorFile.rangeColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height14)),
                          const SizedBox(height: SizeFile.height3),
                          Container(
                            width: Get.width,
                            margin:
                                const EdgeInsets.only(top: SizeFile.height10),
                            height: SizeFile.height1,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height15)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AssetImagePaths.devonImage,
                                height: SizeFile.height50,
                                width: SizeFile.height50,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: SizeFile.height20,
                                      left: SizeFile.height20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(StringConfig.devonLane,
                                              style: TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiMedium,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                          Text(StringConfig.toDay,
                                              style: TextStyle(
                                                  color: ColorFile.orContinue,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height11)),
                                        ],
                                      ),
                                      const SizedBox(height: SizeFile.height8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starYellow,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                          const SizedBox(
                                              width: SizeFile.height4),
                                          Image.asset(
                                            AssetImagePaths.starIcon,
                                            height: SizeFile.height14,
                                            width: SizeFile.height14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: SizeFile.height15),
                          const Text(StringConfig.goodHotelWorthEveryPenny,
                              style: TextStyle(
                                  color: ColorFile.rangeColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height14)),
                          const SizedBox(height: SizeFile.height3),
                          Container(
                            width: Get.width,
                            margin:
                                const EdgeInsets.only(top: SizeFile.height10),
                            height: SizeFile.height1,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height25)
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const RatingAndReviewScreen());
                        },
                        child: const Center(
                          child: Text(StringConfig.seeMore,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorFile.appColor,
                                  color: ColorFile.appColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height16)),
                        ),
                      ),
                      const SizedBox(height: SizeFile.height50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ignore: must_be_immutable

Widget displayMedia(String path, VideoPlayerController controller) {
  if (path.endsWith('.mp4')) {
    if (controller.value.isInitialized) {
      controller.play();
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          VideoPlayer(controller),
          GetBuilder<VideoController>(
            builder: (c) => Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    c.togglePlayButton(controller);
                  },
                  icon: Icon(
                    c.isPlaying(controller) ? Icons.play_arrow : Icons.pause,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    c.toggleVolume(controller);
                  },
                  icon: Icon(
                    c.isMute(controller) ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  } else {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
