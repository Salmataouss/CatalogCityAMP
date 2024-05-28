import 'package:get/get.dart';

import '../model/attraction_model.dart';
import '../model/place_model.dart';

class FavoriteController extends GetxController {
  List _displayList = [];

  List get displayList => _displayList;

  void updateList() {
    List mergedList = [];

    mergedList.addAll(places);
    mergedList.addAll(internationalTripList);

    for (var place in places) {
      if (place.thingsTodo != null) {
        for (var item in place.thingsTodo!) {
          mergedList.add(item);
        }
      }
      if (place.restaurants != null) {
        for (var item in place.restaurants!) {
          mergedList.add(item);
        }
      }
      if (place.hotels != null) {
        for (var item in place.hotels!) {
          mergedList.add(item);
        }
      }
      if (place.craftstores != null) {
        for (var item in place.craftstores!) {
          mergedList.add(item);
        }
      }
    }

    for (var place in internationalTripList) {
      if (place.thingsTodo != null) {
        for (var item in place.thingsTodo!) {
          mergedList.add(item);
        }
      }
      if (place.restaurants != null) {
        for (var item in place.restaurants!) {
          mergedList.add(item);
        }
      }
      if (place.hotels != null) {
        for (var item in place.hotels!) {
          mergedList.add(item);
        }
      }
      if (place.craftstores != null) {
        for (var item in place.craftstores!) {
          mergedList.add(item);
        }
      }
    }

    _displayList =
        mergedList.where((place) => place.isFavourite == true).toList();

    update();
  }

  void toggleFavouritePlace(PlaceModel place) {
    place.isFavourite = !place.isFavourite;
    update();
  }

  void toggleFavouriteAttraction(Attraction place) {
    place.isFavourite = !place.isFavourite;
    update();
  }
}
