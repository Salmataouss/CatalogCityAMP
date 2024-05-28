import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/controller/place_details_controller.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import 'package:catalog_city_project/util/font_family.dart';
import 'package:catalog_city_project/util/size_config.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../../model/departure_model.dart';

class SelectDepartureScreen extends StatefulWidget {
  const SelectDepartureScreen({Key? key}) : super(key: key);

  @override
  State<SelectDepartureScreen> createState() => _SelectDepartureStateScreen();
}

class _SelectDepartureStateScreen extends State<SelectDepartureScreen> {
  TextEditingController searchController = TextEditingController();
  PlaceDetailsController placeDetailsController =
      Get.put(PlaceDetailsController());
  List<DepartureModel> searchResultList = [
    DepartureModel(
        place: StringConfig.cityCountry1,
        airport: StringConfig.cityAirport1,
        urt: StringConfig.uRT),
    DepartureModel(
        place: StringConfig.cityCountry2,
        airport: StringConfig.cityAirport2,
        urt: StringConfig.sUB),
    DepartureModel(
        place: StringConfig.cityCountry3,
        airport: StringConfig.cityAirport3,
        urt: StringConfig.iXU),
  ];

  @override
  void dispose() {
    placeDetailsController.status.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeFile.height10),
              TextFormField(
                textAlign: TextAlign.start,
                cursorColor: ColorFile.onBordingColor,
                controller: searchController,
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(
                        top: SizeFile.height18,
                        bottom: SizeFile.height8,
                        left: SizeFile.height10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(SizeFile.height8)),
                    hintText: StringConfig.searchdep,
                    hintStyle: const TextStyle(
                        fontSize: SizeFile.height14,
                        fontFamily: satoshiRegular,
                        fontWeight: FontWeight.w500,
                        color: ColorFile.onBordingColor),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(SizeFile.height14),
                      child: Image.asset(AssetImagePaths.searchIcon,
                          height: SizeFile.height14,
                          width: SizeFile.height14,
                          color: ColorFile.onBording2Color),
                    ),
                    suffixIcon: searchController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                searchController.clear();
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: ColorFile.onBordingColor,
                              size: SizeFile.height16,
                            ))
                        : null),
              ),
              SizedBox(height: SizeFile.height24),
              const Text(StringConfig.searchResults,
                  style: TextStyle(
                      decorationColor: ColorFile.onBordingColor,
                      color: ColorFile.onBordingColor,
                      fontFamily: satoshiMedium,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeFile.height16)),
              SizedBox(height: SizeFile.height24),
              _buildSearchResultList(),
              Divider()
            ],
          ),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      backgroundColor: ColorFile.whiteColor,
      elevation: 0,
      title: Obx(
        () => Text(
            placeDetailsController.status.value == "To"
                ? StringConfig.selectDestination
                : StringConfig.selectDeparture,
            style: TextStyle(
                decorationColor: ColorFile.onBordingColor,
                color: ColorFile.onBordingColor,
                fontFamily: satoshiBold,
                fontWeight: FontWeight.w400,
                fontSize: SizeFile.height22)),
      ),
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
    );
  }

  _buildSearchResultList() {
    return ListView.separated(
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                  top: SizeFile.height9, bottom: SizeFile.height12),
              child: Divider(
                color: ColorFile.dividerColor.withOpacity(0.15),
                thickness: 1,
                height: SizeFile.height1,
              ),
            ),
        itemCount: searchResultList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(searchResultList[index].place ?? "",
                      style: TextStyle(
                          decorationColor: ColorFile.onBordingColor,
                          color: ColorFile.onBordingColor,
                          fontFamily: satoshiRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeFile.height14)),
                  Text(searchResultList[index].airport ?? "",
                      style: TextStyle(
                          decorationColor: ColorFile.onBordingColor,
                          color: ColorFile.orContinue,
                          fontFamily: satoshiRegular,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeFile.height12)),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: SizeFile.height8),
                      child: Text(searchResultList[index].urt ?? "",
                          style: TextStyle(
                              decorationColor: ColorFile.onBordingColor,
                              color: ColorFile.onBording2Color,
                              fontFamily: satoshiRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeFile.height14)),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
