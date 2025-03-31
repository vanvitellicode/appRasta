import 'controller/content_moderation_controller.dart';
import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/custom_button.dart';
import 'package:rms/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class ContentModerationDialog extends StatelessWidget {
  ContentModerationDialog(this.controller);

  ContentModerationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(346),
        padding: getPadding(all: 24),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: getPadding(top: 5),
                  child: Text("msg_why_are_you_flagging".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroySemiBold18)),
              Padding(
                  padding: getPadding(top: 26),
                  child: Obx(() => Column(children: [
                        CustomRadioButton(
                            width: getHorizontalSize(298),
                            text: "lbl_off_topic".tr,
                            iconSize: getHorizontalSize(24),
                            value: controller.contentModerationModelObj.value
                                .radioList.value[0],
                            groupValue: controller.radioGroup.value,
                            fontStyle: RadioFontStyle.GilroyMedium16,
                            isRightCheck: true,
                            onChange: (value) {
                              controller.radioGroup.value = value;
                            }),
                        CustomRadioButton(
                            width: getHorizontalSize(298),
                            text: "lbl_inappropriate".tr,
                            iconSize: getHorizontalSize(24),
                            value: controller.contentModerationModelObj.value
                                .radioList.value[1],
                            groupValue: controller.radioGroup.value,
                            margin: getMargin(top: 27),
                            fontStyle: RadioFontStyle.GilroyMedium16,
                            isRightCheck: true,
                            onChange: (value) {
                              controller.radioGroup.value = value;
                            }),
                        CustomRadioButton(
                            width: getHorizontalSize(298),
                            text: "lbl_spam".tr,
                            iconSize: getHorizontalSize(24),
                            value: controller.contentModerationModelObj.value
                                .radioList.value[2],
                            groupValue: controller.radioGroup.value,
                            margin: getMargin(top: 27),
                            fontStyle: RadioFontStyle.GilroyMedium16,
                            isRightCheck: true,
                            onChange: (value) {
                              controller.radioGroup.value = value;
                            }),
                        CustomRadioButton(
                            width: getHorizontalSize(298),
                            text: "msg_notify_space_administration".tr,
                            iconSize: getHorizontalSize(24),
                            value: controller.contentModerationModelObj.value
                                .radioList.value[3],
                            groupValue: controller.radioGroup.value,
                            margin: getMargin(top: 27),
                            fontStyle: RadioFontStyle.GilroyMedium16,
                            isRightCheck: true,
                            onChange: (value) {
                              controller.radioGroup.value = value;
                            })
                      ]))),
              Padding(
                  padding: getPadding(top: 27),
                  child: Text("lbl_comments".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium16Bluegray700)),
              Container(
                  width: double.maxFinite,
                  child: Container(
                      width: getHorizontalSize(298),
                      margin: getMargin(top: 12),
                      padding: getPadding(all: 7),
                      decoration: AppDecoration.outlineBluegray100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder6),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: getPadding(left: 9, top: 5),
                                child: Text("msg_say_something_about".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtGilroyMedium14Bluegray400)),
                            CustomImageView(
                                svgPath: ImageConstant.imgGroup216,
                                height: getSize(16),
                                width: getSize(16),
                                alignment: Alignment.centerRight,
                                margin: getMargin(top: 36))
                          ]))),
              Padding(
                  padding: getPadding(top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_cancel".tr,
                                margin: getMargin(right: 5),
                                variant: ButtonVariant.OutlineBlueA700,
                                fontStyle:
                                    ButtonFontStyle.GilroyMedium16BlueA700,
                                onTap: () {
                                  onTapCancel();
                                })),
                        Expanded(
                            child: CustomButton(
                                height: getVerticalSize(50),
                                text: "lbl_submit".tr,
                                margin: getMargin(left: 5)))
                      ]))
            ]));
  }

  onTapCancel() {
    Get.back();
  }
}
