import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rms/presentation/map_screen/controller/map_controller.dart';
import 'package:latlong2/latlong.dart';

class MapState extends GetxController {
  late MyMapController mapController;
  LatLng center = LatLng(37.7749, -122.4194);
  double zoom = 10.0;

  @override
  void onInit() {
    super.onInit();
    mapController = MyMapController();
  }

  void updateCenter(LatLng newCenter) {
    center = newCenter;
    mapController.move(newCenter, zoom);
    update();
  }
}