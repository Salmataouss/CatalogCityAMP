import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/test_model.dart';
import '../util/asset_image_paths.dart';
import '../util/string_config.dart';

class InternationalController extends GetxController {
  RxList<bool> tripSelectItems = List.generate(8, (index) => false).obs;
  RxList<bool> popularPlacesIndex = List.generate(8, (index) => false).obs;
  RxList<bool> internationalTripIndex = List.generate(5, (index) => false).obs;
  RxList<bool> homeSecondListIndex = List.generate(5, (index) => false).obs;

  RxList<PlaceModelTest> internationalList = [
    PlaceModelTest(
      text: StringConfig.vietnam,
      icon: AssetImagePaths.lockingImage,
    ),
    PlaceModelTest(
      text: StringConfig.hoChiMinhCity,
      icon: AssetImagePaths.montereyImage,
    ),
    PlaceModelTest(
      text: StringConfig.sanFranciso,
      icon: AssetImagePaths.sanFrancisImage,
    ),
    PlaceModelTest(
      text: StringConfig.monterey,
      icon: AssetImagePaths.montereyImage,
    ),
    PlaceModelTest(
      text: StringConfig.hogsFeet,
      icon: AssetImagePaths.hogsFeetImage,
    ),
    PlaceModelTest(
      text: StringConfig.lockinge,
      icon: AssetImagePaths.lockingImage,
    ),
    PlaceModelTest(
      text: StringConfig.chester,
      icon: AssetImagePaths.chesterImage,
    ),
    PlaceModelTest(
      text: StringConfig.lockinge,
      icon: AssetImagePaths.lockingImage,
    ),
  ].obs;
  RxList<PlaceModelTest> homeSecondList = [
    ///////
    PlaceModelTest(
      text: StringConfig.casablanca,
      icon: AssetImagePaths.casablancaImage,
    ),
    PlaceModelTest(
      text: StringConfig.agadir,
      icon: AssetImagePaths.agadirImage,
    ),
    PlaceModelTest(
      text: StringConfig.marrakech,
      icon: AssetImagePaths.marrakechImage,
    ),
    PlaceModelTest(
      text: StringConfig.tanger,
      icon: AssetImagePaths.tangerImage,
    ),
    PlaceModelTest(
      text: StringConfig.ouarzazat,
      icon: AssetImagePaths.ouarzazatImage,
    ),
  ].obs;

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
      icon: AssetImagePaths.srinagar2,
    ),
    PlaceModelTest(
      text: StringConfig.rishikesh,
      icon: AssetImagePaths.rishikesh2,
    ),
    PlaceModelTest(
      text: StringConfig.mussoorie,
      icon: AssetImagePaths.srinagarImage,
    ),
    PlaceModelTest(
      text: StringConfig.yamunotri,
      icon: AssetImagePaths.manaliImage,
    ),
  ].obs;

  RxList<PlaceModelTest> internationalTripList = [
    PlaceModelTest(
      text: StringConfig.vietnam,
      icon: AssetImagePaths.vietnamImage,
    ),
    PlaceModelTest(
      text: StringConfig.hoChiMinhCity,
      icon: AssetImagePaths.hoChiMinhCityImage,
    ),
    PlaceModelTest(
      text: StringConfig.losAngeles,
      icon: AssetImagePaths.losAngelesImage,
    ),
    PlaceModelTest(
      text: StringConfig.hogsFeet,
      icon: AssetImagePaths.hogsFeetImage,
    ),
    PlaceModelTest(
      text: StringConfig.monterey,
      icon: AssetImagePaths.montereyImage,
    ),
  ].obs;
}
