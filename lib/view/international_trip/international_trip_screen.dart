import 'package:catalog_city_project/view/home_screen/widgets/place_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/string_config.dart';
import '../../model/place_model.dart';
import '../../util/asset_image_paths.dart';
import '../../util/colors.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';

class InterNationalTripScreen extends StatefulWidget {
  const InterNationalTripScreen({Key? key}) : super(key: key);

  @override
  State<InterNationalTripScreen> createState() =>
      _InterNationalTripScreenState();
}

class _InterNationalTripScreenState extends State<InterNationalTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
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
                  itemCount: internationalTripList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return PlaceCard(placeDetails: internationalTripList[index]);
                  }),
              SizedBox(height: SizeFile.height20)
            ],
          ),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: ColorFile.whiteColor,
      elevation: 0,
      title: const Text(StringConfig.internationalTrip,
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
