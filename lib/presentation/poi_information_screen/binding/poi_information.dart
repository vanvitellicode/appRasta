import '../controller/poi_information_controller.dart';
import 'package:get/get.dart';

class PoiInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PoiInformationController());
  }
}
