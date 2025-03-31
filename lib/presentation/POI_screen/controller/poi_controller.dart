import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/presentation/POI_screen/models/poi_model.dart';

class POIController extends GetxController {
  Rx<POIModel> POIModelObj = POIModel().obs;
  RxList<Place> placeList = <Place>[].obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updatePlaces(placeList) {
     POIModelObj.update((val) {
      val!.places.value = placeList;
      update();
    });
  }
}