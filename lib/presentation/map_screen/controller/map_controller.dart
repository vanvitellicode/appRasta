// Controller class
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/itinerary_screen/models/itinerary.dart';
import 'package:rms/presentation/map_screen/models/map_model.dart';

class MyMapController extends GetxController {
  var userLocation = UserLocation().obs;
  RxList<Marker> markers = <Marker>[].obs;
  void getUserLocation() async {

  }

  void move(LatLng newCenter, double zoom) {}

  void update_Map(Itinerary itineraryItem) {
    markers.value.clear();
    itineraryItem.places.forEach((element) {
      markers.add(Marker(
        width: 80.0,
        height: 80.0,
        point: element.location,
        child: Column(
          children:[ Icon(
            Icons.location_on,
            color: Colors.orange,
            size: 50,
          ),
          Expanded(child: Text(element.name))
          ],
        ),
      ));
    });

  }

}