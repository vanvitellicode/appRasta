import 'package:latlong2/latlong.dart';

class Place {
  String name;
  String image;
  String rating;
  String duration;
  String vehicle;
  LatLng location;
  String description;
  
  Place({
    required this.name,
    required this.image,
    required this.rating,
    required this.duration,
    required this.vehicle,
    required this.location,
    required this.description,
  });


}