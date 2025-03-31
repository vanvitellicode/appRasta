// bindings/qr_scanner_binding.dart
import 'package:get/get.dart';
import 'package:rms/presentation/qrcode_screen/controller/qrcode_controller.dart';


class QRScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRCodeController>(() => QRCodeController());
  }
}