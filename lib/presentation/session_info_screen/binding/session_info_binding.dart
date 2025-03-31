import '../controller/session_info_controller.dart';
import 'package:get/get.dart';

class SessionInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SessionInfoController());
  }
}
