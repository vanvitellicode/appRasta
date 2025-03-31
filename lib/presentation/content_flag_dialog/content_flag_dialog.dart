import 'controller/content_flag_controller.dart';
import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/custom_checkbox.dart';

class ContentFlagDialog extends StatelessWidget {
  ContentFlagDialog(this.controller);

  ContentFlagController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        298,
      ),
      padding: getPadding(
        left: 24,
        top: 26,
        right: 24,
        bottom: 26,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: getHorizontalSize(
              219,
            ),
            child: Text(
              "msg_choose_reason_for".tr,
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtGilroySemiBold16Bluegray900,
            ),
          ),
          Obx(
            () => CustomCheckbox(
              width: getHorizontalSize(
                250,
              ),
              text: "lbl_it_is_spam".tr,
              value: controller.isCheckbox.value,
              margin: getMargin(
                top: 26,
              ),
              fontStyle: CheckboxFontStyle.GilroyMedium16,
              isRightCheck: true,
              onChange: (value) {
                controller.isCheckbox.value = value;
              },
            ),
          ),
          Obx(
            () => CustomCheckbox(
              width: getHorizontalSize(
                250,
              ),
              text: "msg_it_is_inappropriate".tr,
              value: controller.isCheckbox1.value,
              margin: getMargin(
                top: 29,
              ),
              fontStyle: CheckboxFontStyle.GilroyMedium16,
              isRightCheck: true,
              onChange: (value) {
                controller.isCheckbox1.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
