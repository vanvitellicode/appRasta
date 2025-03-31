// controllers/qr_code_controller.dart
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async';

class QRCodeController extends GetxController {
  var scannedData = ''.obs;
  var isSuccess  = false.obs;
  var urlpath = ''.obs;
  StreamSubscription? scanSubscription;
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    scanSubscription = controller.scannedDataStream.listen((scanData) {
      scannedData.value = scanData.code ?? '';
      if (scannedData.value.isNotEmpty) {
             isSuccess.value = true;
              urlpath.value = scannedData.value;
        }
        scanSubscription?.cancel(); // Annulla l'abbonamento al flusso
      });
  }



  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}
