import '../controller/augmented_reality_viewer_controller.dart';
import 'package:get/get.dart';

class ARViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AugmentedRealityViewerController());
  }
}
