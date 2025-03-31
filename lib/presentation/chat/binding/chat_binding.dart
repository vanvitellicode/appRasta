import 'package:get/get.dart';
import 'package:rms/presentation/chat/controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
