import 'package:catalog_city_project/model/attraction_model.dart';
import 'package:get/get.dart';

class AttractionController extends GetxController {
  int _selectedImage = 0;
  int get selectedImage => _selectedImage;

  List<String> _mediaList = [];
  List<String> get mediaList => _mediaList;

  void setImages(Attraction a) {
    if (a.video != null) {
      _mediaList = [a.video!, ...a.images];
    } else {
      _mediaList = a.images;
    }
  }

  void updateSelectedImage(int index) {
    _selectedImage = index;
    update();
  }
}
