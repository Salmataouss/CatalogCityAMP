import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:catalog_city_project/view/home_screen/widgets/attraction_card.dart';
import 'package:catalog_city_project/view/home_screen/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/place_details_controller.dart';
import '../../controller/video_controller.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import 'empty_favourite_screen.dart';

class MyFavoriteScreen extends StatelessWidget {
  MyFavoriteScreen({Key? key}) : super(key: key);

  final FavoriteController favoriteController = Get.find();
  final PlaceDetailsController placeDetailsController =
      Get.put(PlaceDetailsController());
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.favorite,
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
      body: GetBuilder<FavoriteController>(
        builder: (controller) => controller.displayList.isEmpty
            ? EmptyFavouriteScreen()
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: SizeFile.height10),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: SizeFile.height20),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: SizeFile.height172,
                                mainAxisExtent: SizeFile.height190,
                                crossAxisSpacing: SizeFile.height20,
                                mainAxisSpacing: SizeFile.height20),
                        itemCount: controller.displayList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          if (controller.displayList[index] is Attraction) {
                            return AttractionCard(
                                attraction: controller.displayList[index]);
                          } else {
                            return PlaceCard(
                                placeDetails: controller.displayList[index]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
