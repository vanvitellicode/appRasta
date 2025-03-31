import '../controller/augmented_reality_controller.dart';
import 'package:get/get.dart';

class AugmentedRealityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AugmentedRealityController());
  }
}
