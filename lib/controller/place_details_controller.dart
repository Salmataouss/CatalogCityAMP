import 'package:get/get.dart';

import '../model/place_model.dart';

class PlaceDetailsController extends GetxController {
  RxString status = "".obs;
  bool isExpanded = false;

  int _selectedImage = 0;
  int get selectedImage => _selectedImage;

  List<String> _mediaList = [];
  List<String> get mediaList => _mediaList;

  void setImages(PlaceModel place) {
    if (place.video != null) {
      _mediaList = [place.video!, ...place.images];
    } else {
      _mediaList = place.images;
    }
  }

  void updateSelectedImage(int index) {
    _selectedImage = index;
    update();
  }
}
