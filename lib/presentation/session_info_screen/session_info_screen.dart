import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:rms/widgets/drawer.dart';

import 'controller/session_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/widgets/app_bar/appbar_image.dart';
import 'package:rms/widgets/app_bar/appbar_title.dart';
import 'package:rms/widgets/app_bar/custom_app_bar.dart';
import 'package:rms/widgets/custom_button.dart';
import 'package:rms/widgets/custom_drop_down.dart';
import 'package:rms/widgets/custom_text_form_field.dart';

class SessionInfoScreen extends GetWidget<SessionInfoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray50,
            appBar: AppBar(
                leadingWidth: 40,
                automaticallyImplyLeading: true,

                centerTitle: true,
                title: AppbarTitle(text: "msg_session_title".tr)),
                drawer: MainDrawer(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Card(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(left: 16, top: 26, right: 16, bottom: 26),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("lbl_select_vehicle".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16Bluegray800),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    //place icon
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Icon((Icons.directions_car)),
                                    ),
                                    Flexible(
                                      child: CustomDropDown(
                                          icon: Container(
                                              margin: getMargin(left: 30, right: 16),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgArrowdownBlueGray400)),
                                          hintText: "Select Available Vehicle",
                                          margin: getMargin(top: 5),
                                          items: controller.session_info_ModelObj.value
                                              .dropdownItemList.value,
                                          onChanged: (value) {
                                            controller.onSelected(value);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getSize(24)),
                              Text("lbl_select_time".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16Bluegray800),
                                
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: Icon((Icons.timer)),
                                      ),
                                    Flexible(
                                      child: CustomDropDown(
                                          icon: Container(
                                              margin: getMargin(left: 30, right: 16),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgArrowdownBlueGray400)),
                                          margin: getMargin(top: 5),
                                          hintText: "Select Available Time",
                                          items: controller.session_info_ModelObj.value.dropdownTimeItemList.value,
                                          
                                          onChanged: (value) {
                                            controller.onTimeSelected(value);
                                          }
                                        ),
                                    ),
                                 
                                  ],
                                ),
                              ),
                              SizedBox(height: getSize(24)),
                              Text("lbl_your_interests".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtGilroyMedium16Bluegray800),
                                
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                      Padding(
                                          padding: const EdgeInsets.only(right: 16.0),
                                          child: Icon((Icons.interests)),
                                        ),
                                    Flexible(
                                      child: MultiSelectDropDown<String>(
                                              onOptionSelected: (List<ValueItem> selectedOptions) {controller.onInterestSelected(selectedOptions);},
                                              options: controller.session_info_ModelObj.value.selectableInterest,
                                              selectionType: SelectionType.multi,
                                              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                                              dropdownHeight: 300,
                                              optionTextStyle: const TextStyle(fontSize: 16),
                                              selectedOptionIcon: const Icon(Icons.check_circle),
                                              
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                  
                              CustomButton(
                                  height: getVerticalSize(50),
                                  text: "lbl_submit".tr,
                                  margin: getMargin(top: 29, bottom: 5),
                                  onTap: () {
                                    controller.onTapSubmit();
                                  })
                            ])),
                  ),
                ),
              ),
            )));
  }

  onTapArrowleft4() {
    Get.back();
  }
}
