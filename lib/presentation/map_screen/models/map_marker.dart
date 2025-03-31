import 'package:latlong2/latlong.dart';

class MapMarker {
  final LatLng location;
  final String title;
  final String subtitle;

  MapMarker({
    required this.location,
    required this.title,
    required this.subtitle,
  });
}