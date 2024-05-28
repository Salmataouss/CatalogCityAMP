import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';
import '../../../util/asset_image_paths.dart';
import '../../../util/colors.dart';
import '../../../util/font_family.dart';
import '../../../util/size_config.dart';
import '../../attractions/attraction_details_screen.dart';

FavoriteController favoriteController = Get.find();

class AttractionCard extends StatelessWidget {
  const AttractionCard({super.key, required this.attraction});

  final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AttractionDetailsScreen(attraction: attraction));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Stack(alignment: Alignment.topRight, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              attraction.images[0],
              height: SizeFile.height172,
              width: SizeFile.height148,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: SizeFile.height148,
            height: SizeFile.height172,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Colors.transparent,
                    Colors.black87,
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: SizeFile.height15, top: SizeFile.height12),
            child: GetBuilder<FavoriteController>(
              builder: (c) => GestureDetector(
                onTap: () {
                  c.toggleFavouriteAttraction(attraction);
                  c.updateList();
                },
                child: GetBuilder<FavoriteController>(
                  builder: (c) => Image.asset(
                      attraction.isFavourite
                          ? AssetImagePaths.redHeard
                          : AssetImagePaths.heartCircle,
                      height: SizeFile.height18),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 30,
            left: SizeFile.height5,
            child: Padding(
              padding: const EdgeInsets.only(left: SizeFile.height10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeFile.height130,
                    child: Text(attraction.title,
                        style: const TextStyle(
                            color: ColorFile.whiteColor,
                            fontFamily: satoshiMedium,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeFile.height14)),
                  ),
                  const SizedBox(height: SizeFile.height6),
                  Row(
                    children: [
                      Image.asset(
                        AssetImagePaths.starYellow,
                        height: SizeFile.height9,
                        width: SizeFile.height9,
                      ),
                      const SizedBox(width: SizeFile.height4),
                      Image.asset(
                        AssetImagePaths.starYellow,
                        height: SizeFile.height9,
                      ),
                      const SizedBox(width: SizeFile.height4),
                      Image.asset(
                        AssetImagePaths.starYellow,
                        height: SizeFile.height9,
                      ),
                      const SizedBox(width: SizeFile.height4),
                      Image.asset(
                        AssetImagePaths.starYellow,
                        height: SizeFile.height9,
                      ),
                      const SizedBox(width: SizeFile.height4),
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
      ),
    );
  }
}
