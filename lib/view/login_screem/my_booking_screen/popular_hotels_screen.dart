import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/language_controller.dart';
import '../../../util/asset_image_paths.dart';
import '../../../util/colors.dart';
import '../../../util/font_family.dart';
import '../../../util/size_config.dart';
import '../../../util/string_config.dart';
import 'hotel_details_screen.dart';

class PopularHotelsScreen extends StatefulWidget {
  const PopularHotelsScreen({Key? key}) : super(key: key);

  @override
  State<PopularHotelsScreen> createState() => _PopularHotelsScreenState();
}

class _PopularHotelsScreenState extends State<PopularHotelsScreen> {
  List<Map<String, dynamic>> popularHotelList = [
    {
      "title": StringConfig.raisonHotel,
      "Icon": AssetImagePaths.raisonHotelImage
    },
    {
      "title": StringConfig.madsonHotel,
      "Icon": AssetImagePaths.madsonHotelImage
    },
    {"title": StringConfig.nusaPenida, "Icon": AssetImagePaths.nusaPenidaImage},
    {
      "title": StringConfig.mirrorsHotel,
      "Icon": AssetImagePaths.raisonHotelImage
    },
    {
      "title": StringConfig.blueJayHotel,
      "Icon": AssetImagePaths.madsonHotelImage
    },
    {
      "title": StringConfig.igniteHotel,
      "Icon": AssetImagePaths.nusaPenidaImage
    },
    {
      "title": StringConfig.blueJayHotel,
      "Icon": AssetImagePaths.madsonHotelImage
    },
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
        title: const Text(StringConfig.popularHotels,
            style: TextStyle(
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
                left: SizeFile.height10,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                itemCount: popularHotelList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(const HotelDetailsScreen());
                    },
                    child: Container(
                      width: Get.width,
                      height: SizeFile.height96,
                      margin: const EdgeInsets.only(
                          left: SizeFile.height20,
                          right: SizeFile.height20,
                          top: SizeFile.height16),
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
                        padding: const EdgeInsets.all(SizeFile.height8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(alignment: Alignment.topRight, children: [
                              Image.asset(
                                popularHotelList[index]["Icon"],
                                height: SizeFile.height76,
                                width: SizeFile.height95,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: SizeFile.height6,
                                    right: SizeFile.height6),
                                child: Image.asset(AssetImagePaths.heartCircle,
                                    height: SizeFile.height16,
                                    width: SizeFile.height16,
                                    fit: BoxFit.contain),
                              ),
                            ]),
                            Expanded(
                                child: Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                    top: SizeFile.height4,
                                    left: languageController.arb.value
                                        ? SizeFile.height4
                                        : SizeFile.height12,
                                    right: languageController.arb.value
                                        ? SizeFile.height12
                                        : SizeFile.height4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(popularHotelList[index]["title"],
                                        style: const TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiBold,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height14)),
                                    const SizedBox(height: SizeFile.height4),
                                    Row(
                                      children: [
                                        Image.asset(
                                          AssetImagePaths.southeastLogo,
                                          height: SizeFile.height12,
                                          width: SizeFile.height12,
                                        ),
                                        const SizedBox(width: SizeFile.height5),
                                        const Text(
                                            StringConfig.southeastAsiaEast,
                                            style: TextStyle(
                                                color:
                                                    ColorFile.onBording2Color,
                                                fontFamily: satoshiRegular,
                                                fontWeight: FontWeight.w400,
                                                fontSize: SizeFile.height12)),
                                      ],
                                    ),
                                    const SizedBox(height: SizeFile.height8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                            text: const TextSpan(
                                                text: StringConfig.price598Line,
                                                style: TextStyle(
                                                    decorationColor: ColorFile
                                                        .onBordingColor,
                                                    color: ColorFile.appColor,
                                                    fontFamily: satoshiBold,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeFile.height12),
                                                children: [
                                              TextSpan(
                                                  text: StringConfig.perNight,
                                                  style: TextStyle(
                                                      decorationColor: ColorFile
                                                          .onBordingColor,
                                                      color:
                                                          ColorFile.orContinue,
                                                      fontFamily: satoshiMedium,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          SizeFile.height14))
                                            ])),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AssetImagePaths.starYellow,
                                              height: SizeFile.height12,
                                              width: SizeFile.height12,
                                            ),
                                            const SizedBox(
                                                width: SizeFile.height2),
                                            const Text(StringConfig.reviews48,
                                                style: TextStyle(
                                                    decorationColor: ColorFile
                                                        .onBordingColor,
                                                    color: ColorFile
                                                        .onBording2Color,
                                                    fontFamily: satoshiRegular,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeFile.height10)),
                                            const SizedBox(
                                                width: SizeFile.height2),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: SizeFile.height10)
          ],
        ),
      ),
    );
  }
}
