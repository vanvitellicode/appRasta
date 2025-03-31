import 'dart:math';

import 'package:ar_location_view/ar_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:uuid/uuid.dart';

enum AnnotationType { CRBUniPG, OldPark, Chiesa }

class Annotation extends ArAnnotation {
  final AnnotationType type;

  final url = 'https://www.google.com';
  Annotation({required this.type, required String uid,required Position position}) : super(uid: uid, position: position);
  
}

AnnotationType getRandomAnnotation() {
  final types = AnnotationType.values.toList();
  final index = Random.secure().nextInt(types.length);
  return types[index];
}



Position getRandomLocation(double centerLatitude, double centerLongitude,
    double deltaLat, double deltaLon) {
  var lat = centerLatitude;
  var lon = centerLongitude;

  final latDelta = -(deltaLat / 2) + Random.secure().nextDouble() * deltaLat;
  final lonDelta = -(deltaLon / 2) + Random.secure().nextDouble() * deltaLon;
  lat = lat + latDelta;
  lon = lon + lonDelta;

  return Position(
    longitude: lon,
    latitude: lat,
    timestamp: DateTime.now(),
    accuracy: 1,
    altitude: 1,
    heading: 1,
    speed: 1,
    speedAccuracy: 1,
    altitudeAccuracy: 0,
    headingAccuracy: 0,
  );
}
