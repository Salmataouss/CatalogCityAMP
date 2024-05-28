import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:catalog_city_project/util/asset_image_paths.dart';
import 'package:catalog_city_project/util/colors.dart';
import '../../controller/home_controller.dart';
import '../../util/font_family.dart';
import '../../util/size_config.dart';
import '../../util/string_config.dart';
import '../login_screem/my_booking_screen/booking_screen.dart';
import '../profile/edit_screen.dart';
import '../profile/profile_screen.dart';
import 'package:catalog_city_project/view/upcoming_trip/upcoming_trip_screen.dart';
import 'drawer_screen.dart';
import 'home_page.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String appBarTitle = "";
int bottomNavigationIndex = 0;
List<Widget> bottomPageList = <Widget>[
  const HomePage(),
  const BookingScreen(),
  UpcomingTripScreen(isAppbar: true),
  ProfileScreen(isAppbar: true),
];

class _HomeScreenState extends State<HomeScreen> {
  void onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          homeController.appbarTitle.value = "";
          break;
        case 1:
          homeController.appbarTitle.value = StringConfig.booking;
          break;
        case 2:
          homeController.appbarTitle.value = StringConfig.upcomingTrip;
          break;
        case 3:
          homeController.appbarTitle.value = StringConfig.profile;
          break;
      }
      bottomNavigationIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorFile.whiteColor,
      key: _globalKey,
      appBar: _buildAppbar(),
      drawer: DrawerScreen(),
      body: bottomPageList[bottomNavigationIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            top: Platform.isAndroid ? SizeFile.height80 : SizeFile.height100),
        child: PersistentTabView(
          margin: EdgeInsets.zero,
          padding: const NavBarPadding.only(left: 0, right: 0),
          context,
          onItemSelected: onItemTapped,
          screens: bottomPageList,
          items: [
            PersistentBottomNavBarItem(
              activeColorPrimary: ColorFile.appColor,
              iconSize: SizeFile.height60,
              icon: Image.asset(
                  bottomNavigationIndex == 0
                      ? AssetImagePaths.bottomNavigationFeelIcon1
                      : AssetImagePaths.bottomNavigationIcon1,
                  height: SizeFile.height22,
                  width: SizeFile.height22),
              title: "Home",
            ),
            PersistentBottomNavBarItem(
              activeColorPrimary: ColorFile.appColor,
              icon: Image.asset(
                  bottomNavigationIndex == 1
                      ? AssetImagePaths.bottomNavigationFeelIcon2
                      : AssetImagePaths.bottomNavigationIcon2,
                  color: bottomNavigationIndex == 1
                      ? ColorFile.appColor
                      : ColorFile.orContinue,
                  height: SizeFile.height22,
                  width: SizeFile.height22),
              title: "History",
            ),
            PersistentBottomNavBarItem(
                activeColorPrimary: ColorFile.appColor,
                icon: Image.asset(
                    bottomNavigationIndex == 2
                        ? AssetImagePaths.bottomNavigationFeelIcon3
                        : AssetImagePaths.bottomNavigationIcon3,
                    color: bottomNavigationIndex == 2
                        ? ColorFile.appColor
                        : ColorFile.orContinue,
                    height: SizeFile.height26,
                    width: SizeFile.height26),
                title: "Search"),
            PersistentBottomNavBarItem(
              activeColorPrimary: ColorFile.appColor,
              icon: Image.asset(
                  bottomNavigationIndex == 3
                      ? AssetImagePaths.bottomNavigationFeelIcon4
                      : AssetImagePaths.profileImage,
                  height: SizeFile.height24,
                  width: SizeFile.height24),
              title: "Profile",
            )
          ],
          confineInSafeArea: true,
          backgroundColor: ColorFile.whiteColor,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: const NavBarDecoration(
              colorBehindNavBar: ColorFile.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: ColorFile.emailBorderColor,
                    offset: Offset(0, 0),
                    spreadRadius: SizeFile.height2,
                    blurRadius: SizeFile.height2)
              ]),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style5,
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      backgroundColor: ColorFile.whiteColor,
      title: Obx(
        () => Text(homeController.appbarTitle.value,
            style: const TextStyle(
                decorationColor: ColorFile.onBordingColor,
                color: ColorFile.onBordingColor,
                fontFamily: satoshiBold,
                fontWeight: FontWeight.w400,
                fontSize: SizeFile.height22)),
      ),
      iconTheme: const IconThemeData(color: ColorFile.blackColor),
      centerTitle: true,
      leading: bottomNavigationIndex == 0
          ? GestureDetector(
              onTap: () {
                _globalKey.currentState!.openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.only(
                    left: SizeFile.height2, top: SizeFile.height5),
                child: Icon(Icons.menu),
              ))
          : bottomNavigationIndex == 1 || bottomNavigationIndex == 3
              ? const Text("")
              : const Text(""),
      actions: [
        bottomNavigationIndex == 0
            ? Padding(
                padding: const EdgeInsets.only(
                    right: SizeFile.height20, left: SizeFile.height20),
                child: GestureDetector(
                    onTap: () {
                      Get.to(const NotificationScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: SizeFile.height4),
                      child: Image.asset(
                        AssetImagePaths.notificationIcon,
                        height: SizeFile.height32,
                        width: SizeFile.height32,
                      ),
                    )),
              )
            : bottomNavigationIndex == 3
                ? GestureDetector(
                    onTap: () {
                      Get.to(EditScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: SizeFile.height20,
                          right: SizeFile.height20,
                          top: SizeFile.height10),
                      child: Text(StringConfig.edit,
                          style: TextStyle(
                              decorationColor: ColorFile.onBordingColor,
                              color: ColorFile.appColor,
                              fontFamily: satoshiMedium,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeFile.height16)),
                    ),
                  )
                : const SizedBox()
      ],
    );
  }
}
