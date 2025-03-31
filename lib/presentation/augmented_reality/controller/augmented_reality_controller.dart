import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/data/models/selectionPopupModel/ListItineraryFromGetRepoModel.dart';
import 'package:rms/presentation/POI_screen/models/places.dart';
import 'package:rms/presentation/augmented_reality/models/annotations.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary_model.dart';
import 'package:rms/presentation/session_info_screen/controller/session_info_controller.dart';
import 'package:uuid/uuid.dart';

class AugmentedRealityController extends GetxController {
 
  RxList<Annotation> annotations = <Annotation>[].obs;
  @override
  void onInit() {

    super.onInit();
  }

void fakeAnnotation({
  required Position position,
  int distance = 1500,
  int numberMaxPoi = 100,
}) {

  this.annotations.add(Annotation(
    uid: const Uuid().v1(),
    position: Position(
            longitude: 12.357676866572636, 
            latitude: 43.11940695157225, 
            //longitude: 14.20545037986544, 
            //latitude: 40.84637718579631, 
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
    type: AnnotationType.values.toList()[0],
  ));

  this.annotations.add(Annotation(
    uid: const Uuid().v1(),
    position: Position(
            longitude: 12.3540505201653,
            latitude: 43.11884309481758, 
            //longitude: 14.20352596107729,
            //latitude:  40.84505231156363,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
    type: AnnotationType.values.toList()[1],
  ));


    this.annotations.add(Annotation(
    uid: const Uuid().v1(),
    position: Position(
            longitude:  12.35933447168634, 
            latitude:  43.118893998765806,
            //longitude:  14.20357147966659,
            //latitude: 40.84458458203468,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
    type: AnnotationType.values.toList()[2],
  ));
  annotations.refresh();

  
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
