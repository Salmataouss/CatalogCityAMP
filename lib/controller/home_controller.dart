import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' as root_bundle;

import '../model/place_model.dart';
import '../model/test_model.dart';
import '../util/asset_image_paths.dart';
import '../util/string_config.dart';

class HomeController extends GetxController {
  RxString appbarTitle = "".obs;
  RxList<bool> selectPopularItems = List.generate(5, (index) => false).obs;
  RxList<bool> selectedItems = List.generate(5, (index) => false).obs;
  RxList<bool> selectTripItems = List.generate(5, (index) => false).obs;

  RxInt selectItem = 0.obs;

  void updateSelectedItem(int index) {
    selectItem.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    setPlaces();
    setInternationalTrips();
  }

  Future<void> setPlaces() async {
    List json = await loadJsonFromAssets('assets/dev/cities.json');
    places.value = json.map((place) => PlaceModel.fromJson(place)).toList();
  }

  Future<void> setInternationalTrips() async {
    List json = await loadJsonFromAssets('assets/dev/international_trip.json');
    internationalTripList.value =
        json.map((place) => PlaceModel.fromJson(place)).toList();
  }

  Future<List> loadJsonFromAssets(String path) async {
    String jsonString = await root_bundle.rootBundle.loadString(path);
    return jsonDecode(jsonString)['data'];
  }

  RxList<PlaceModelTest> popularPlacesList = [
    PlaceModelTest(
      text: StringConfig.srinagar,
      icon: AssetImagePaths.srinagarImage,
    ),
    PlaceModelTest(
      text: StringConfig.manali,
      icon: AssetImagePaths.manaliImage,
    ),
    PlaceModelTest(
      text: StringConfig.darjeeling,
      icon: AssetImagePaths.darjeeling,
    ),
    PlaceModelTest(
      text: StringConfig.rishikesh,
      icon: AssetImagePaths.rishikeshImage,
    ),
    PlaceModelTest(
      text: StringConfig.srinagar,
      icon: AssetImagePaths.srinagarImage,
    ),
  ].obs;
}
