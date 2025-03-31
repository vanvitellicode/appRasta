import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/presentation/home_screen/models/home_model.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary_model.dart';

class Home_Controller extends GetxController {
    RxList<Itinerary> placeList = <Itinerary>[].obs;
  @override
  void onInit() {

    super.onInit();
  }

  void updateHome(Itinerary itineraryItem) {
    placeList.value.clear();
    placeList.value.add(itineraryItem);
  }
}
