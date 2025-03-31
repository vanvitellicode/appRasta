import '../controller/itinerary_controller.dart';
import 'package:get/get.dart';

class ItineraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItineraryController());
  }
}
