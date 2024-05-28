import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/place_details_controller.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import 'attraction_details_screen.dart';

class AttractionList extends StatefulWidget {
  const AttractionList({Key? key, required this.attraction}) : super(key: key);

  final List<Attraction> attraction;

  @override
  State<AttractionList> createState() => _AttractionListState();
}

class _AttractionListState extends State<AttractionList> {
  final PlaceDetailsController placeDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeFile.height10),
            GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeFile.height20,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: MediaQuery.of(context).size.height / 4.3,
                  crossAxisSpacing: SizeFile.height15,
                  mainAxisSpacing: SizeFile.height16,
                  crossAxisCount: 2,
                ),
                itemCount: widget.attraction.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => AttractionDetailsScreen(
                          attraction: widget.attraction[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Stack(alignment: Alignment.topRight, children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.attraction[index].images[0],
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
                                c.toggleFavouriteAttraction(
                                    widget.attraction[index]);
                              },
                              child: Image.asset(
                                  widget.attraction[index].isFavourite
                                      ? AssetImagePaths.redHeard
                                      : AssetImagePaths.heartCircle,
                                  height: SizeFile.height18),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height / 15,
                          left: SizeFile.height5,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: SizeFile.height10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: SizeFile.height130,
                                  child: Text(widget.attraction[index].title,
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
                }),
            SizedBox(height: SizeFile.height20)
          ],
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: ColorFile.whiteColor,
      elevation: 0,
      title: const Text('Attraction List',
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
    );
  }
}
