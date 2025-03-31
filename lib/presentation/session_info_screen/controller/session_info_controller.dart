import 'dart:convert';

import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/data/apiClient/api_client.dart';
import 'package:rms/data/models/selectionPopupModel/ListItineraryFromGetRepoModel.dart';
import 'package:rms/presentation/session_info_screen/models/session_info_model.dart';
import 'package:flutter/material.dart';

class SessionInfoController extends GetxController {
  TextEditingController textPlaceholderController = TextEditingController();

  Rx<SessionInfoModel> session_info_ModelObj = SessionInfoModel().obs;
  RxInt selectedTime = 0.obs;
  RxList<String> selectedInterest = <String>[].obs;
  SelectionPopupModel? selectedDropDownValue;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textPlaceholderController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    session_info_ModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    session_info_ModelObj.value.dropdownItemList.refresh();
  }
  onTimeSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    session_info_ModelObj.value.dropdownTimeItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    session_info_ModelObj.value.dropdownTimeItemList.refresh();
  }
  void setSelectedTime(int? value) {
    selectedTime.value = value!;
    print(selectedTime.value);
  }

  void onInterestSelected(List<ValueItem<dynamic>> value) {
    selectedInterest.clear();
    for (int i = 0; i < value.length; i++) {
      selectedInterest.add(value[i].value!);
    }
  }

  void onTapSubmit2() {
    Get.offNamed(AppRoutes.itinerary_screen);
  }
  Future onTapSubmit() async {
      var response = await ApiClient().getItinerary();
      if (response != null) {
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          session_info_ModelObj.update((val) {
            
            val!.listItineraryFromGetRepoModel.value = ListItineraryFromGetRepoModel.fromJson(data);
            update();
            Get.toNamed(AppRoutes.itinerary_screen);
          });
        }
      }
  }

}
