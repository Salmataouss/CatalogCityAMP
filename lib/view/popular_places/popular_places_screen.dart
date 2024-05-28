import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/international_controller.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import '../popular_place_package/popular_place_package_screen.dart';

class PopularPlacesScreen extends StatelessWidget {
  PopularPlacesScreen({Key? key}) : super(key: key);

  final popularController = Get.put(InternationalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.popularPlaces,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeFile.height8),
            GridView.builder(
                itemCount: popularController.popularPlacesList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: SizeFile.height20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeFile.height12,
                    mainAxisSpacing: SizeFile.height12),
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(const PopularPlacePackageScreen());
                    },
                    child: Stack(alignment: Alignment.topRight, children: [
                      Image.asset(
                          popularController.popularPlacesList[index].icon!,
                          height: SizeFile.height / 1.6,
                          width: SizeFile.width / 1.6),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: SizeFile.height12, top: SizeFile.height8),
                        child: Obx(() => GestureDetector(
                              onTap: () {
                                popularController.popularPlacesIndex[index] =
                                    !popularController
                                        .popularPlacesIndex[index];
                              },
                              child: Image.asset(
                                  popularController.popularPlacesIndex[index]
                                      ? AssetImagePaths.redHeard
                                      : AssetImagePaths.heartCircle,
                                  height: SizeFile.height18),
                            )),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height / 70,
                        left: SizeFile.height20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  popularController
                                      .popularPlacesList[index].text!,
                                  style: const TextStyle(
                                      color: ColorFile.whiteColor,
                                      fontFamily: satoshiBold,
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeFile.height14)),
                              const Text(StringConfig.loremIpsumDolorSitAmet,
                                  style: TextStyle(
                                      color: ColorFile.whiteColor,
                                      fontFamily: satoshiLight,
                                      fontWeight: FontWeight.w300,
                                      fontSize: SizeFile.height9)),
                              const SizedBox(height: SizeFile.height6),
                              Row(
                                children: [
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
                  );
                }),
            SizedBox(height: SizeFile.height12),
          ],
        ),
      ),
    );
  }
}
