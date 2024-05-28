import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog_city_project/view/login_screem/my_booking_screen/popular_hotels_screen.dart';
import 'package:catalog_city_project/view/login_screem/my_booking_screen/select_departure_screen.dart';
import 'package:catalog_city_project/view/login_screem/my_booking_screen/select_flight_screen.dart';
import '../../../controller/booking_controller.dart';
import '../../../controller/place_details_controller.dart';
import '../../../util/asset_image_paths.dart';
import '../../../util/colors.dart';
import '../../../util/common_button.dart';
import '../../../util/font_family.dart';
import '../../../util/size_config.dart';
import '../../../util/string_config.dart';
import '../../place_details/bottom_date_picker.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();
  final BookingController bookingController = Get.put(BookingController());

  var oneWayIndex = 0;
  RxInt classIndex = 0.obs;
  List oneWayList = [
    StringConfig.oneWay,
    StringConfig.roundTrip,
    StringConfig.multicity
  ];
  PlaceDetailsController placeDetailsController =
      Get.put(PlaceDetailsController());
  List classList = [
    StringConfig.economy,
    StringConfig.premiumEconomy,
    StringConfig.business
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorFile.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: SizeFile.height20),
                child: Column(
                  children: [
                    const SizedBox(height: SizeFile.height10),
                    GestureDetector(
                        onTap: () {
                          Get.to(PopularHotelsScreen());
                        },
                        child: _buildBookingList()),
                    const SizedBox(height: SizeFile.height32),
                    SizedBox(
                      height: SizeFile.height39,
                      child: _buildTripList(),
                    ),
                    const SizedBox(height: SizeFile.height24),
                    Container(
                      padding: const EdgeInsets.only(
                        top: SizeFile.height10,
                        bottom: SizeFile.height10,
                      ),
                      decoration: BoxDecoration(
                          color: ColorFile.whiteColor,
                          borderRadius: BorderRadius.circular(SizeFile.height8),
                          border: Border.all(color: ColorFile.whiteColor),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: SizeFile.height2,
                                color: ColorFile.verticalDividerColor,
                                blurRadius: SizeFile.height2,
                                offset: Offset(0, 0))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(const SelectDepartureScreen());
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: SizeFile.height12),
                                Image.asset(AssetImagePaths.londonFlight,
                                    height: SizeFile.height16),
                                const SizedBox(width: SizeFile.height8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(StringConfig.from,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.orContinue,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height12)),
                                    Text(StringConfig.londonStanstedSTN,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height14)),
                                    SizedBox(height: SizeFile.height12),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: SizeFile.height1,
                            width: Get.width,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height12),
                          GestureDetector(
                            onTap: () {
                              placeDetailsController.status.value = "To";
                              Get.to(SelectDepartureScreen());
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: SizeFile.height12),
                                Image.asset(AssetImagePaths.santaFlight,
                                    height: SizeFile.height16),
                                const SizedBox(width: SizeFile.height8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(StringConfig.to,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.orContinue,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height12)),
                                    Text(StringConfig.moroccoMarrakech,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height14)),
                                    SizedBox(height: SizeFile.height12),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: SizeFile.height1,
                            width: Get.width,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height12),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: SizeFile.height15),
                                child: BottomDatePicker(),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: SizeFile.height12),
                                Image.asset(AssetImagePaths.selectFlightDate,
                                    height: SizeFile.height16),
                                const SizedBox(width: SizeFile.height8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConfig.departureDate,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.orContinue,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height12)),
                                    Obx(
                                      () => Text(bookingController.date.value,
                                          style: TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height14)),
                                    ),
                                    SizedBox(height: SizeFile.height12),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: SizeFile.height1,
                            width: Get.width,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height12),
                          GestureDetector(
                            onTap: () {
                              travelersClassBottomSheet(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: SizeFile.height12),
                                Image.asset(AssetImagePaths.twoUserIcon,
                                    height: SizeFile.height16),
                                const SizedBox(width: SizeFile.height8),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConfig.travelersClass,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.orContinue,
                                            fontFamily: satoshiRegular,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeFile.height12)),
                                    Obx(
                                      () => Text(
                                          '${bookingController.getSum()} Person',
                                          style: TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiRegular,
                                              fontWeight: FontWeight.w400,
                                              fontSize: SizeFile.height14)),
                                    ),
                                    SizedBox(height: SizeFile.height12),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: SizeFile.height1,
                            width: Get.width,
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          const SizedBox(height: SizeFile.height24),
                          GestureDetector(
                            onTap: () {
                              Get.to(SelectFlightScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: SizeFile.height12),
                              child: ButtonCommon(
                                text: StringConfig.search,
                                buttonColor: ColorFile.appColor,
                                textColor: ColorFile.whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: SizeFile.height12),
                        ],
                      ),
                    ),
                    const SizedBox(height: SizeFile.height32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(StringConfig.recentSearch,
                            style: TextStyle(
                                decorationColor: ColorFile.onBordingColor,
                                color: ColorFile.onBordingColor,
                                fontFamily: satoshiBold,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeFile.height16)),
                        GestureDetector(
                          onTap: () {
                            Get.to(const SelectFlightScreen());
                          },
                          child: const Text(StringConfig.viewAll,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorFile.appColor,
                                  color: ColorFile.appColor,
                                  fontFamily: satoshiBold,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeFile.height14)),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeFile.height16),
                    Container(
                      padding: const EdgeInsets.only(
                        top: SizeFile.height10,
                        bottom: SizeFile.height10,
                      ),
                      decoration: BoxDecoration(
                          color: ColorFile.whiteColor,
                          borderRadius: BorderRadius.circular(SizeFile.height8),
                          border: Border.all(color: ColorFile.whiteColor),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 7,
                                color: ColorFile.verticalDividerColor,
                                blurRadius: 7,
                                offset: Offset(0, 0))
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: SizeFile.height26,
                                width: SizeFile.height101,
                                margin: const EdgeInsets.only(
                                    right: SizeFile.height12,
                                    left: SizeFile.height12,
                                    bottom: SizeFile.height12),
                                decoration: BoxDecoration(
                                  color: ColorFile.appColor.withOpacity(0.15),
                                  borderRadius:
                                      BorderRadius.circular(SizeFile.height4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        AssetImagePaths.calendarAppColorIcon,
                                        height: SizeFile.height16,
                                        color: ColorFile.appColor),
                                    const SizedBox(width: SizeFile.height4),
                                    const Text(StringConfig.feb162022,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.appColor,
                                            fontFamily: satoshiMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height12)),
                                  ],
                                ),
                              ),
                              Container(
                                height: SizeFile.height26,
                                width: SizeFile.height62,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                    left: SizeFile.height12,
                                    right: SizeFile.height12,
                                    bottom: SizeFile.height12),
                                decoration: BoxDecoration(
                                  color: ColorFile.appColor.withOpacity(0.15),
                                  borderRadius:
                                      BorderRadius.circular(SizeFile.height4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        AssetImagePaths.whiteProfileIcon,
                                        height: SizeFile.height16,
                                        color: ColorFile.appColor),
                                    const Text(StringConfig.seat1,
                                        style: TextStyle(
                                            decorationColor:
                                                ColorFile.onBordingColor,
                                            color: ColorFile.appColor,
                                            fontFamily: satoshiMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height12)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: SizeFile.height1,
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                bottom: SizeFile.height12),
                            color: ColorFile.appColor.withOpacity(0.15),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeFile.height12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(StringConfig.time0900AM,
                                    style: TextStyle(
                                        decorationColor:
                                            ColorFile.onBordingColor,
                                        color: ColorFile.appColor,
                                        fontFamily: satoshiMedium,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeFile.height12)),
                                Text(StringConfig.time1030AM,
                                    style: TextStyle(
                                        color: ColorFile.appColor,
                                        fontFamily: satoshiMedium,
                                        fontWeight: FontWeight.w200,
                                        fontSize: SizeFile.height12)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: SizeFile.height12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(StringConfig.yIA,
                                    style: TextStyle(
                                        decorationColor:
                                            Color.fromARGB(255, 239, 201, 201),
                                        color: ColorFile.onBordingColor,
                                        fontFamily: satoshiBold,
                                        fontWeight: FontWeight.w700,
                                        fontSize: SizeFile.height14)),
                                Image.asset(
                                  AssetImagePaths.flightDotCircle,
                                  height: SizeFile.height28,
                                ),
                                const Text(StringConfig.lOP,
                                    style: TextStyle(
                                        color: ColorFile.onBordingColor,
                                        fontFamily: satoshiBold,
                                        fontWeight: FontWeight.w700,
                                        fontSize: SizeFile.height14)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeFile.height12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(StringConfig.yogyakarta,
                                    style: TextStyle(
                                        color: ColorFile.orContinue,
                                        fontFamily: satoshiMedium,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeFile.height12)),
                                Text(StringConfig.lombok,
                                    style: TextStyle(
                                        color: ColorFile.orContinue,
                                        fontFamily: satoshiMedium,
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeFile.height12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SizeFile.height20)
                  ],
                )),
          )),
    );
  }

  travelersClassBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: ColorFile.whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeFile.height16),
        topRight: Radius.circular(SizeFile.height16),
      )),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: SizeFile.height24,
                      right: SizeFile.height24,
                      top: SizeFile.height17,
                      bottom: SizeFile.size10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(StringConfig.travelersClass,
                          style: TextStyle(
                              color: ColorFile.onBordingColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height16)),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            AssetImagePaths.closeIcon,
                            height: SizeFile.height10,
                            width: SizeFile.height10,
                            color: ColorFile.onBordingColor,
                          ))
                    ],
                  ),
                ),
                Divider(
                  color: ColorFile.appColor.withOpacity(0.15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizeFile.height24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: SizeFile.height16),
                          const Text(StringConfig.addNumberOfTravellers,
                              style: TextStyle(
                                  color: ColorFile.onBording2Color,
                                  fontFamily: satoshiMedium,
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeFile.height14)),
                          const SizedBox(height: SizeFile.height24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: const TextSpan(
                                          text: StringConfig.adult,
                                          style: TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiMedium,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeFile.height16),
                                          children: [
                                        TextSpan(
                                            text: StringConfig.no12yrsAndAbove,
                                            style: TextStyle(
                                                decorationColor:
                                                    ColorFile.onBordingColor,
                                                color:
                                                    ColorFile.onBording2Color,
                                                fontFamily: satoshiRegular,
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeFile.height11))
                                      ])),
                                  const SizedBox(height: SizeFile.height2),
                                  const Text(StringConfig.onTheDayOfTravel,
                                      style: TextStyle(
                                          color: ColorFile.orContinue,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.decrementCounter1();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.minusIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                  const SizedBox(width: SizeFile.height7),
                                  Obx(
                                    () => SizedBox(
                                      width: SizeFile.height20,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                              '${bookingController.item1}',
                                              style: const TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: SizeFile.height7),
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.incrementCounter1();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.plushIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: SizeFile.height24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: const TextSpan(
                                          text: StringConfig.children,
                                          style: TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiMedium,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeFile.height16),
                                          children: [
                                        TextSpan(
                                            text: StringConfig.y212yrs,
                                            style: TextStyle(
                                                decorationColor:
                                                    ColorFile.onBordingColor,
                                                color:
                                                    ColorFile.onBording2Color,
                                                fontFamily: satoshiRegular,
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeFile.height11))
                                      ])),
                                  const SizedBox(height: SizeFile.height2),
                                  const Text(StringConfig.onTheDayOfTravel,
                                      style: TextStyle(
                                          color: ColorFile.orContinue,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.decrementCounter2();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.minusIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                  const SizedBox(width: SizeFile.height7),
                                  Obx(
                                    () => SizedBox(
                                      width: SizeFile.height20,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                              "${bookingController.item2}",
                                              style: const TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: SizeFile.height7),
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.incrementCounter2();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.plushIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: SizeFile.height24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: const TextSpan(
                                          text: StringConfig.infant,
                                          style: TextStyle(
                                              decorationColor:
                                                  ColorFile.onBordingColor,
                                              color: ColorFile.onBordingColor,
                                              fontFamily: satoshiMedium,
                                              fontWeight: FontWeight.w500,
                                              fontSize: SizeFile.height16),
                                          children: [
                                        TextSpan(
                                            text: StringConfig.y212yrs,
                                            style: TextStyle(
                                                decorationColor:
                                                    ColorFile.onBordingColor,
                                                color:
                                                    ColorFile.onBording2Color,
                                                fontFamily: satoshiRegular,
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeFile.height11))
                                      ])),
                                  const SizedBox(height: SizeFile.height2),
                                  const Text(StringConfig.onTheDayOfTravel,
                                      style: TextStyle(
                                          color: ColorFile.orContinue,
                                          fontFamily: satoshiRegular,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeFile.height12)),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.decrementCounter3();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.minusIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                  const SizedBox(width: SizeFile.height7),
                                  Obx(
                                    () => SizedBox(
                                      width: SizeFile.height20,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                              "${bookingController.item3}",
                                              style: const TextStyle(
                                                  color:
                                                      ColorFile.onBordingColor,
                                                  fontFamily: satoshiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: SizeFile.height16)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: SizeFile.height7),
                                  GestureDetector(
                                      onTap: () {
                                        bookingController.incrementCounter3();
                                      },
                                      child: Image.asset(
                                        AssetImagePaths.plushIcon,
                                        height: SizeFile.height20,
                                        width: SizeFile.height20,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: SizeFile.height32),
                      const Text(StringConfig.classN,
                          style: TextStyle(
                              color: ColorFile.onBording2Color,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height14)),
                      const SizedBox(height: SizeFile.height16),
                      ListView.builder(
                          itemCount: classList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => GestureDetector(
                                          onTap: () {
                                            classIndex.value = index;
                                          },
                                          child: Image.asset(
                                            classIndex.value == index
                                                ? AssetImagePaths.feelCircleIcon
                                                : AssetImagePaths
                                                    .whiteCircleIcon,
                                            height: SizeFile.height16,
                                            width: SizeFile.height16,
                                          )),
                                    ),
                                    const SizedBox(width: SizeFile.height12),
                                    Text(classList[index],
                                        style: const TextStyle(
                                            color: ColorFile.onBordingColor,
                                            fontFamily: satoshiMedium,
                                            fontWeight: FontWeight.w500,
                                            fontSize: SizeFile.height16)),
                                  ],
                                ),
                                const SizedBox(height: SizeFile.height12),
                                Divider(
                                  color: ColorFile.appColor.withOpacity(0.15),
                                  thickness: 1,
                                  height: 1,
                                ),
                                const SizedBox(height: SizeFile.height12),
                              ],
                            );
                          }),
                      const SizedBox(height: SizeFile.height24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: ShortButton(
                                text: StringConfig.cancel,
                                textColor: ColorFile.onBordingColor,
                                buttonColor:
                                    ColorFile.appColor.withOpacity(0.15),
                              )),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: ShortButton(
                                text: StringConfig.apply,
                                textColor: ColorFile.whiteColor,
                                buttonColor: ColorFile.appColor,
                              )),
                        ],
                      ),
                      const SizedBox(height: SizeFile.height24),
                    ],
                  ),
                )
              ],
            );
          }),
        );
      },
    );
  }

  _buildBookingList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //TO BOOK HOTEL
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetImagePaths.hotelImage,
              height: SizeFile.height56,
            ),
            Text(StringConfig.hotel,
                style: TextStyle(
                    decorationColor: ColorFile.onBordingColor,
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiMedium,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetImagePaths.trainImage,
              height: SizeFile.height56,
            ),
            Text(StringConfig.train,
                style: TextStyle(
                    decorationColor: ColorFile.onBordingColor,
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiMedium,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetImagePaths.carImage,
              height: SizeFile.height56,
            ),
            Text(StringConfig.car,
                style: TextStyle(
                    decorationColor: ColorFile.onBordingColor,
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiMedium,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetImagePaths.flightImage,
              height: SizeFile.height56,
            ),
            Text(StringConfig.flight,
                style: TextStyle(
                    decorationColor: ColorFile.onBordingColor,
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiMedium,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AssetImagePaths.busImage,
              height: SizeFile.height56,
            ),
            Text(StringConfig.bus,
                style: TextStyle(
                    decorationColor: ColorFile.onBordingColor,
                    color: ColorFile.onBordingColor,
                    fontFamily: satoshiMedium,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeFile.height14)),
          ],
        ),
      ],
    );
  }

  _buildTripList() {
    return ListView.builder(
        itemCount: oneWayList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: SizeFile.height14),
            child: Container(
              width: MediaQuery.of(context).size.width / 3.62,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorFile.whiteColor,
                  borderRadius: BorderRadius.circular(SizeFile.height8),
                  border: Border.all(color: ColorFile.verticalDividerColor),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: SizeFile.height1,
                        color: ColorFile.verticalDividerColor,
                        blurRadius: SizeFile.height1,
                        offset: Offset(0, 0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(oneWayList[index],
                      style: const TextStyle(
                          color: ColorFile.onBordingColor,
                          fontFamily: satoshiMedium,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeFile.height12)),
                  const SizedBox(width: SizeFile.height12),
                  GestureDetector(
                      onTap: () {
                        oneWayIndex = index;
                        setState(() {});
                      },
                      child: Image.asset(
                        oneWayIndex == index
                            ? AssetImagePaths.feelCircleIcon
                            : AssetImagePaths.whiteCircleIcon,
                        height: SizeFile.height16,
                        width: SizeFile.height16,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
