import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/place_model.dart';
import '../../../util/asset_image_paths.dart';
import '../../../util/colors.dart';
import '../../../util/font_family.dart';
import '../../../util/size_config.dart';
import '../../place_details/place_details_screen.dart';

FavoriteController favoriteController = Get.find();

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key, required this.placeDetails});

  final PlaceModel placeDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          PlaceDetailsScreen1(placeDetails: placeDetails),
        );
      },
      child: Container(
        width: SizeFile.height148,
        padding: EdgeInsets.all(SizeFile.height8),
        margin: const EdgeInsets.only(right: SizeFile.height18),
        decoration: BoxDecoration(
            color: ColorFile.whiteColor,
            borderRadius: BorderRadius.circular(SizeFile.height10),
            border: Border.all(
                color: ColorFile.borderColor, width: SizeFile.height1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  placeDetails.images[0],
                  height: SizeFile.height104,
                  width: SizeFile.height132,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 105, top: 91, right: SizeFile.height4),
                child: GetBuilder<FavoriteController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        favoriteController.toggleFavouritePlace(placeDetails);
                        favoriteController.updateList();
                      },
                      child: Image.asset(
                          placeDetails.isFavourite
                              ? AssetImagePaths.redHeard
                              : AssetImagePaths.heartCircle,
                          height: SizeFile.height20),
                    );
                  },
                ),
              ),
            ]),
            Text(placeDetails.title,
                style: const TextStyle(
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiBold,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
            SizedBox(height: SizeFile.height5),
            Row(
              children: [
                Image.asset(
                  AssetImagePaths.southeastLogo,
                  height: SizeFile.height10,
                  width: SizeFile.height10,
                ),
                const SizedBox(width: SizeFile.height5),
                Flexible(
                  child: Text(placeDetails.address,
                      style: TextStyle(
                          color: ColorFile.onBordingColor,
                          fontFamily: satoshiRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeFile.height10)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
