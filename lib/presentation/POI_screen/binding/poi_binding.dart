import '../controller/poi_controller.dart';
import 'package:get/get.dart';

class POIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => POIController());
  }
}
