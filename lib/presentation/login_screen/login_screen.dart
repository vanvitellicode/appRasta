import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/core/utils/validation_functions.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/app_bar/custom_app_bar.dart';
import 'package:rms/widgets/custom_button.dart';
import 'package:rms/widgets/custom_text_form_field.dart';
import 'package:rms/domain/googleauth/google_auth_helper.dart';
import 'package:rms/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(54),
                leadingWidth: 40,
                centerTitle: true,
                ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 16, top: 22, right: 16, bottom: 22),
                    child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image(
                            image: AssetImage(ImageConstant.imgVectorBlueA70034x360,),
                            width: 200,
                            height: 200,),
                          ),
                          Text("lbl_email".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyMedium16),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.emailInputField,
                              hintText: "msg_enter_your_email".tr,
                              margin: getMargin(top: 7),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 19),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16)),
                          Obx(() => CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.passwordInputField,
                              hintText: "lbl_enter_password".tr,
                              margin: getMargin(top: 6),
                              padding: TextFormFieldPadding.PaddingT12,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(all: 12),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant.imgEye
                                                  : ImageConstant.imgEye))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(44)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword.value)),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgCheckbox,
                                    height: getSize(20),
                                    width: getSize(20)),
                                Padding(
                                    padding:
                                        getPadding(left: 8, top: 1, bottom: 1),
                                    child: Text("lbl_remember_me".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroyMedium14)),
                                Spacer(),
                                Padding(
                                    padding: getPadding(top: 3),
                                    child: Text("msg_forgot_password".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtGilroyMedium14BlueA700))
                              ])),
                          CustomButton(
                              height: getVerticalSize(50),
                              width: getHorizontalSize(396),
                              text: "lbl_log_in2".tr,
                              margin: getMargin(top: 25),
                              onTap: (){controller.onTapLogin();},),
                          Padding(
                              padding: getPadding(top: 26),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 10, bottom: 7),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blueGray200)),
                                    Text("msg_or_continue_with".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtGilroyRegular16),
                                    Padding(
                                        padding: getPadding(top: 10, bottom: 7),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.blueGray200))
                                  ])),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "msg_sign_in_with_google".tr,
                              margin: getMargin(top: 28),
                              variant: ButtonVariant.OutlineBlueA700,
                              padding: ButtonPadding.PaddingT15,
                              fontStyle: ButtonFontStyle.GilroyMedium16BlueA700,
                              prefixWidget: Container(
                                  margin: getMargin(right: 8),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgGoogle)),
                              onTap: () {
                                Get.toNamed(AppRoutes.homeScreen);

                                //onTapSigninwithgoogle();
                              }),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 28, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Don’t have an account? ".tr,
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#ff12282a"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: " ",
                                            style: TextStyle(
                                                color: ColorConstant.fromHex(
                                                    "#ff12282a"),
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.w700)),
                                      ],
                                      
                                      ),
                                      
                                      textAlign: TextAlign.left))),
                          CustomButton(
                              height: getVerticalSize(50),
                              text: "lbl_sign_up".tr,
                              margin: getMargin(top: 5),
                              variant: ButtonVariant.OutlineBlueA700,
                              padding: ButtonPadding.PaddingT15,
                              fontStyle: ButtonFontStyle.GilroyMedium16BlueA700,
                              onTap: () {
                                Get.toNamed(AppRoutes.accountCreationScreen);
                              }),
                                      
                        ])))));
  }

  onTapSigninwithgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapSigninwithfacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapArrowleft() {
    Get.back();
  }
}
