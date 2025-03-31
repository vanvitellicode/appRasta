// views/qr_scanner_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rms/presentation/qrcode_screen/controller/qrcode_controller.dart';

class QRScannerView extends StatelessWidget {
  final QRCodeController controller = Get.put(QRCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner')),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: controller.onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Scanned URL: ${controller.scannedData.value}'),
                  if (controller.isSuccess.value)
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/arviewer', arguments: {'arg1': controller.urlpath.value});
                      },
                      child: Text('View 3D Object'),
                    ),
                
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}