

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/ar_viewer/controller/augmented_reality_viewer_controller.dart';

class AugmentedRealityViewerScreen extends GetView<AugmentedRealityViewerController> {
  final AugmentedRealityViewerController controller = Get.put(AugmentedRealityViewerController());
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example app'),
        centerTitle: true,
      ),
      body: ModelViewer(src: args["arg1"], ar: true)
    );
  }
}
