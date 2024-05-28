import 'dart:io';

import 'package:catalog_city_project/controller/favorite_controller.dart';
import 'package:catalog_city_project/controller/video_controller.dart';
import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:catalog_city_project/model/place_model.dart';
import 'package:catalog_city_project/view/attractions/attraction_list.dart';
import 'package:catalog_city_project/view/home_screen/widgets/attraction_card.dart';
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
import '../../controller/home_controller.dart';
import '../../controller/place_details_controller.dart';
import '../../util/font_family.dart';

var width = Get.width;
var height = Get.height;

class PlaceDetailsScreen1 extends StatefulWidget {
  final PlaceModel placeDetails;
  const PlaceDetailsScreen1({Key? key, required this.placeDetails})
      : super(key: key);

  @override
  State<PlaceDetailsScreen1> createState() => _PlaceDetailsScreen1State();
}

class _PlaceDetailsScreen1State extends State<PlaceDetailsScreen1> {
  PlaceDetailsController placeDetailsController =
      Get.put(PlaceDetailsController());
  VideoController videoController = Get.put(VideoController());

  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    placeDetailsController.setImages(widget.placeDetails);
    debugPrint(placeDetailsController.mediaList.toString());
    if (widget.placeDetails.video != null) {
      _controller = VideoPlayerController.asset(widget.placeDetails.video!);
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

  HomeController homeController = Get.find();
  FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorFile.whiteColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GetBuilder<PlaceDetailsController>(
                      builder: (c) => SizedBox(
                        height: 500,
                        child: displayMedia(
                            c.mediaList[c.selectedImage], _controller),
                      ),
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
                                      .load(widget.placeDetails.images[0]))
                                  .buffer
                                  .asUint8List(); // convert in to Uint8List
                              final file = File(
                                  "${dir.path}/image.jpg"); // import 'dart:io'
                              await file.writeAsBytes(byte);
                              // Share
                              await Share.shareXFiles([XFile(file.path)],
                                  text:
                                      'Hi look at this cool attraction in ${widget.placeDetails.title}');
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
                            itemCount: placeDetailsController.mediaList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return GetBuilder<PlaceDetailsController>(
                                builder: (c) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: c.selectedImage == index
                                          ? SizeFile.height20
                                          : SizeFile.height26),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
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
                                              width: c.selectedImage == index
                                                  ? SizeFile.height60
                                                  : SizeFile.height40,
                                              height: c.selectedImage == index
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
                          Text(widget.placeDetails.title,
                              style: TextStyle(
                                  color: ColorFile.onBordingColor,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height26)),
                          GetBuilder<FavoriteController>(
                            builder: (controller) {
                              return GestureDetector(
                                onTap: () {
                                  favoriteController.toggleFavouritePlace(
                                      widget.placeDetails);
                                  favoriteController.updateList();
                                },
                                child: Image.asset(
                                  widget.placeDetails.isFavourite
                                      ? AssetImagePaths.redHeard
                                      : AssetImagePaths.heartCircle,
                                  height: SizeFile.height26,
                                  width: SizeFile.height26,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: SizeFile.height16),
                      ReadMoreText(
                        widget.placeDetails.description,
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
                                            Text(widget.placeDetails.address,
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
                                                    widget
                                                        .placeDetails.latitude,
                                                    widget
                                                        .placeDetails.longitude,
                                                  ),
                                                  title: StringConfig.google,
                                                  description:
                                                      StringConfig.googlePlex,
                                                );
                                              },
                                              child: Text(
                                                  StringConfig.viewOnMap,
                                                  style: TextStyle(
                                                      color: ColorFile.appColor,
                                                      decoration: TextDecoration
                                                          .underline,
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
                      const SizedBox(height: SizeFile.height22),
                      const SizedBox(height: SizeFile.height10),
                    ],
                  ),
                ),
                _buildAttraction(
                    widget.placeDetails, homeController.selectItem.value)
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

Widget _buildAttraction(PlaceModel place, int i) {
  List<Attraction>? data;
  List<String> arr = ['Restaurants', 'Things To Do', 'Hotels', 'Craft Stores'];
  switch (i) {
    case 0:
      data = place.restaurants;
      break;
    case 1:
      data = place.thingsTodo;
      break;
    case 2:
      data = place.hotels;
      break;
    case 3:
      data = place.craftstores;
      break;
  }

  if (data == null) {
    return SizedBox();
  } else {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                arr[i],
                style: TextStyle(
                  color: ColorFile.onBordingColor,
                  fontFamily: satoshiBold,
                  fontWeight: FontWeight.w400,
                  fontSize: SizeFile.height16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AttractionList(attraction: data!));
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
        SizedBox(
            height: Get.height / 4.7,
            child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: SizeFile.height10, left: SizeFile.height20),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  return AttractionCard(attraction: data![index]);
                })),
      ],
    );
  }
}
