import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:catalog_city_project/view/home_screen/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/view/home_screen/search_screen.dart';
import 'package:catalog_city_project/util/colors.dart';
import '../../controller/home_controller.dart';
import '../../model/place_model.dart';
import '../../util/asset_image_paths.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import '../international_trip/international_trip_screen.dart';
import '../popular_place_package/popular_place_package_screen.dart';
import '../popular_places/popular_places_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());
  final FavoriteController favoriteController =
      Get.put(FavoriteController(), permanent: true);

  List<Map<String, dynamic>> homeFirstList = [
    {"title": StringConfig.restau, "Icon": AssetImagePaths.restauImage},
    {"title": StringConfig.activ, "Icon": AssetImagePaths.activImage},
    {"title": StringConfig.hotel0, "Icon": AssetImagePaths.hotel0Image},
    {"title": StringConfig.craft, "Icon": AssetImagePaths.craftImage},
  ];
  int homeFirstIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorFile.whiteColor,
        body: FutureBuilder<void>(
          future: homeController.setPlaces(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  const SizedBox(height: SizeFile.height10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeFile.height20,
                      vertical: 0,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const SearchScreen());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.33,
                            height: SizeFile.height38,
                            padding: const EdgeInsets.only(
                                left: SizeFile.height10,
                                right: SizeFile.height10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height10),
                                border: Border.all(
                                    width: SizeFile.height1,
                                    color: ColorFile.borderColor),
                                color: ColorFile.whiteColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AssetImagePaths.searchIcon,
                                  height: SizeFile.height14,
                                  width: SizeFile.height14,
                                  color: ColorFile.onBording2Color,
                                ),
                                const SizedBox(width: SizeFile.height10),
                                const Text(
                                  StringConfig.searchPlaces,
                                  style: TextStyle(
                                      color: ColorFile.onBording2Color,
                                      fontFamily: satoshiRegular,
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeFile.height13),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                            width: SizeFile.height42,
                            height: SizeFile.height38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(SizeFile.height10),
                                border: Border.all(
                                    width: 1, color: ColorFile.borderColor),
                                color: ColorFile.whiteColor),
                            child: Image.asset(
                              AssetImagePaths.voiceIcon,
                              color: ColorFile.blackColor,
                              height: SizeFile.height18,
                              width: SizeFile.height18,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeFile.height20),

                  // liste des categories :
                  SizedBox(
                    height: SizeFile.height36,
                    child: ListView(
                      padding: const EdgeInsets.only(left: SizeFile.height20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          homeFirstList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              homeController.updateSelectedItem(index);
                            },
                            child: Obx(
                              () => Container(
                                height: SizeFile.height36,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                    right: SizeFile.height16),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: SizeFile.height8),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(SizeFile.height8),
                                  border: Border.all(
                                      width: 1,
                                      color: homeController.selectItem.value ==
                                              index
                                          ? ColorFile.whiteColor
                                          : ColorFile.borderColor),
                                  color:
                                      homeController.selectItem.value == index
                                          ? ColorFile.appColor
                                          : ColorFile.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                        homeFirstList[index]["Icon"].toString(),
                                        height: SizeFile.height20),
                                    const SizedBox(width: SizeFile.height8),
                                    Text(
                                      homeFirstList[index]["title"].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: SizeFile.height14,
                                          color:
                                              homeController.selectItem.value ==
                                                      index
                                                  ? ColorFile.whiteColor
                                                  : ColorFile.onBordingColor,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeFile.height24),

                  //first liste agadir casa....
                  SizedBox(
                    height: SizeFile.height190,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: SizeFile.height20),
                      scrollDirection: Axis.horizontal,
                      itemCount: places.length,
                      shrinkWrap: false, //la taille
                      itemBuilder: (BuildContext context, int index) {
                        return PlaceCard(placeDetails: places[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: SizeFile.height24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeFile.height20,
                      vertical: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(StringConfig.internationalTrip,
                            style: TextStyle(
                                color: ColorFile.onBordingColor,
                                fontFamily: satoshiBold,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height16)),
                        GestureDetector(
                          onTap: () {
                            Get.to(const InterNationalTripScreen());
                          },
                          child: const Text(
                            StringConfig.seeMore,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorFile.appColor,
                              color: ColorFile.appColor,
                              fontFamily: satoshiBold,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeFile.height12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeFile.height16),
                  SizedBox(
                    height: SizeFile.height190,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: SizeFile.height20),
                      scrollDirection: Axis.horizontal,
                      itemCount: internationalTripList.length,
                      shrinkWrap: false,
                      itemBuilder: (BuildContext context, int index) {
                        return PlaceCard(
                            placeDetails: internationalTripList[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: SizeFile.height24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeFile.height20,
                      vertical: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(StringConfig.popularPlaces,
                            style: TextStyle(
                                color: ColorFile.onBordingColor,
                                fontFamily: satoshiBold,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height16)),
                        GestureDetector(
                          onTap: () {
                            Get.to(PopularPlacesScreen());
                          },
                          child: const Text(StringConfig.seeMore,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorFile.appColor,
                                  color: ColorFile.appColor,
                                  fontFamily: satoshiBold,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height12)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeFile.height10),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 4.7,
                      child: ListView.builder(
                          padding:
                              const EdgeInsets.only(left: SizeFile.height20),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.popularPlacesList.length,
                          shrinkWrap: false,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(const PopularPlacePackageScreen());
                              },
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: SizeFile.height20),
                                      child: Image.asset(
                                        homeController
                                            .popularPlacesList[index].icon!,
                                        height: SizeFile.height172,
                                        width: SizeFile.height148,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: SizeFile.height28,
                                          top: SizeFile.height12),
                                      child: Obx(() => GestureDetector(
                                            onTap: () {
                                              homeController.selectPopularItems[
                                                      index] =
                                                  !homeController
                                                          .selectPopularItems[
                                                      index];
                                            },
                                            child: Image.asset(
                                                homeController
                                                            .selectPopularItems[
                                                        index]
                                                    ? AssetImagePaths.redHeard
                                                    : AssetImagePaths
                                                        .heartCircle,
                                                height: SizeFile.height18),
                                          )),
                                    ),
                                    Positioned(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              30,
                                      left: SizeFile.height5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: SizeFile.height10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                homeController
                                                    .popularPlacesList[index]
                                                    .text!,
                                                style: const TextStyle(
                                                    color: ColorFile.whiteColor,
                                                    fontFamily: satoshiMedium,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        SizeFile.height14)),
                                            const Text(
                                                StringConfig
                                                    .loremIpsumDolorSitAmet,
                                                style: TextStyle(
                                                    color: ColorFile.whiteColor,
                                                    fontFamily: satoshiLight,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize:
                                                        SizeFile.height10)),
                                            const SizedBox(
                                                height: SizeFile.height6),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AssetImagePaths.starYellow,
                                                  height: SizeFile.height9,
                                                  width: SizeFile.height9,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height4),
                                                Image.asset(
                                                  AssetImagePaths.starYellow,
                                                  height: SizeFile.height9,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height4),
                                                Image.asset(
                                                  AssetImagePaths.starYellow,
                                                  height: SizeFile.height9,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height4),
                                                Image.asset(
                                                  AssetImagePaths.starYellow,
                                                  height: SizeFile.height9,
                                                ),
                                                const SizedBox(
                                                    width: SizeFile.height4),
                                                Image.asset(
                                                  AssetImagePaths.starYellow,
                                                  height: SizeFile.height9,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            );
                          })),
                  const SizedBox(height: SizeFile.height15),
                ]),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
