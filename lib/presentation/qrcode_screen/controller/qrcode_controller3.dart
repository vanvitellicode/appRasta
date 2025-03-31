// controllers/qr_code_controller.dart
/*import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:download_assets/download_assets.dart';
import 'dart:async';

import 'package:rms/presentation/qrcode_screen/models/qrcode_models.dart';

class QRCodeController extends GetxController {
  var scannedData = ''.obs;
  var object3D = Rxn<ThreeDObject>();
  var printerMex = ''.obs;
  DownloadAssetsController downloadAssetsController = DownloadAssetsController();
  var downloaded = false.obs;
  double value = 0.0;
  StreamSubscription? scanSubscription;

  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    scanSubscription = controller.scannedDataStream.listen((scanData) {
      scannedData.value = scanData.code ?? '';
      if (scannedData.value.isNotEmpty) {
        fetch3DObject(scannedData.value);
        scanSubscription?.cancel(); // Annulla l'abbonamento al flusso
      }
    });
    

  }
Future fetch3DObject(String qrData) async {
    await downloadAssetsController.init(assetDir: "assets/");
    downloaded.value = await downloadAssetsController.assetsDirAlreadyExists();
     try {
      value = 0.0;
      downloaded.value = false;
      await downloadAssetsController.startDownload(
          onCancel: () {
            printerMex.value = 'Cancelled by user';
          },
          assetsUrls: [
            'https://cosme.unicampania.it/rasta/or4/triclinio.glb',
          ],
          onProgress: (progressValue) {
            value = progressValue;
              printerMex.value = 'Downloading - ${(progressValue * 100).toStringAsFixed(2)}';

          },
          onDone: () {
              downloaded.value = true;
              printerMex.value = 'Download completed';
          });
    } on DownloadAssetsException catch (e) {
      print(e.toString());
        downloaded.value  = false;
        printerMex.value = 'Error: ${e.toString()}';
    }

    if (downloaded.value ) {
      try {
        // Attempt to load the asset
        if( await downloadAssetsController.assetsFileExists('triclinio.glb')){
          printerMex.value = downloadAssetsController.assetsDir!;
        }        

      } catch (e) {
        // If an error is caught, it means the asset doesn't exist
        printerMex.value = 'File not exists';
      }
    }
  }

  

  @override
  void onClose() {
    qrViewController?.dispose();
    super.onClose();
  }
}
*/