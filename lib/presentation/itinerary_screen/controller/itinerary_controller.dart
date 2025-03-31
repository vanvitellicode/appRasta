import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/data/models/selectionPopupModel/ListItineraryFromGetRepoModel.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary_model.dart';
import 'package:rms/presentation/session_info_screen/controller/session_info_controller.dart';

class ItineraryController extends GetxController {
  Rx<ItineraryModel> POIModelObj =
      ItineraryModel().obs;
  RxList<Itinerary> placeList = <Itinerary>[].obs;
  Rx<ListItineraryFromGetRepoModel> listItineraryFromGetRepoModel = ListItineraryFromGetRepoModel().obs;
  get curTabIdx => 0;


  @override
  void onInit() {
    var session_controller = Get.find<SessionInfoController>();
    listItineraryFromGetRepoModel.value = session_controller.session_info_ModelObj.value.listItineraryFromGetRepoModel.value;
    convertListItineraryFromGetRepoModelToListItinerary();
    super.onInit();
  }

  void convertListItineraryFromGetRepoModelToListItinerary() {
    listItineraryFromGetRepoModel.value.itineraries!.forEach((element) {
      placeList.add(Itinerary(
        name: element.itineraryCode!,
        image: element.features!.first.properties!.image!,
        rating: 0.toString(),
        duration: "00:30",
        vehicle: "Foot",
        places: element.features!.map((e) => 
        Place(
          name: e.properties!.name!,
          image: e.properties!.image!,
          rating: 0.toString(),
          duration: "00:30",
          vehicle: "Foot",
          location: LatLng(e.geometry!.coordinates!.last, e.geometry!.coordinates!.first),
          description: e.properties!.description!,
        )).toList()));
      });
    }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onNavTap(int value) {}

}
