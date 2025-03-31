import 'package:rms/presentation/Home_screen/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Home_Controller());
  }
}
