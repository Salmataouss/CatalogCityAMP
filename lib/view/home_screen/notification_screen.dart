import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/util/colors.dart';
import '../../util/asset_image_paths.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notificationList = [
    {
      "title": StringConfig.manaliTripCancelled,
      "subtitle": StringConfig.youHavesuccessfullyCanceledYourManali,
      "Icon": AssetImagePaths.manaliTripCancelledImage,
      "Date": StringConfig.toDay,
      "time": "15:37 PM",
    },
    {
      "title": StringConfig.raisonHotelBookingSuccess,
      "subtitle": StringConfig.youHavesuccessfullyCanceledYourManali,
      "Icon": AssetImagePaths.raisonHotelBookingImage,
      "Date": StringConfig.date17Dec2022,
      "time": "15:37 PM"
    },
    {
      "title": StringConfig.yourManaliTripComplete,
      "subtitle": StringConfig.youHaveSuccessfullyCanceledYourManaliTrip,
      "Icon": AssetImagePaths.yourManaliTripCompleteImage,
      "Date": StringConfig.date17Dec2022,
      "time": "09:44 PM"
    },
    {
      "title": StringConfig.foodDeliveryComplete,
      "subtitle": StringConfig.youHavesuccessfullyCanceledYourManali,
      "Icon": AssetImagePaths.foodDeliveryCompleteImage,
      "Date": StringConfig.date12Jan2021,
      "time": "15:37 PM"
    },
    {
      "title": StringConfig.madsonHotelInRoomBookingConfirm,
      "subtitle": StringConfig.youHaveSuccessfullyCanceledYourManaliTrip,
      "Icon": AssetImagePaths.madsonHotelInRoomImage,
      "Date": StringConfig.date02Oct2021,
      "time": "15:37 PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorFile.whiteColor,
        elevation: 0,
        title: const Text(StringConfig.notifications,
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
              right: SizeFile.height8,
              left: SizeFile.height8,
              top: SizeFile.height20,
              bottom: SizeFile.height20,
            ),
            child: Image.asset(AssetImagePaths.backArrow2,
                height: SizeFile.height18,
                width: SizeFile.height18,
                color: ColorFile.onBordingColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeFile.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SizeFile.height10),
              ListView.builder(
                  itemCount: notificationList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: SizeFile.height4),
                              child: Image.asset(
                                  notificationList[index]["Icon"].toString(),
                                  height: SizeFile.height42,
                                  width: SizeFile.height42),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: SizeFile.height12,
                                    left: SizeFile.height12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        notificationList[index]["title"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height16)),
                                    Text(
                                        notificationList[index]["subtitle"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height12)),
                                    const SizedBox(height: SizeFile.height4),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              notificationList[index]["Date"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: ColorFile.orContinue,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                          const VerticalDivider(
                                            color: ColorFile.border,
                                            thickness: 1,
                                          ),
                                          Text(
                                              notificationList[index]["time"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: ColorFile.orContinue,
                                                  fontFamily: satoshiRegular,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: SizeFile.height12)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: SizeFile.height24),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
