import 'package:rms/core/app_export.dart';
import 'package:rms/presentation/content_flag_dialog/models/content_flag_model.dart';

class ContentFlagController extends GetxController {
  Rx<ContentFlagModel> contentFlagModelObj = ContentFlagModel().obs;

  Rx<bool> isCheckbox = false.obs;

  Rx<bool> isCheckbox1 = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
