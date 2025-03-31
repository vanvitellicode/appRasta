import 'dart:convert';

import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:rms/core/app_export.dart';
import 'package:rms/data/apiClient/api_client.dart';
import 'package:rms/data/models/selectionPopupModel/ListItineraryFromGetRepoModel.dart';
import 'package:rms/presentation/session_info_screen/models/session_info_model.dart';
import 'package:flutter/material.dart';

class PoiInformationController extends GetxController {
  TextEditingController textPlaceholderController = TextEditingController();

  final restaurantName = 'Pizz8'.obs;
  final weeklyRestDay = 'Riposo Settimanale'.obs;
  final address = 'Via Maria SS. delle Grazie, 90, 81030 Cancello ed Arnone CE'.obs;
  final ratingInfo = '⭐ 3.0 • Minimo €10.0 • Tariffa di consegna'.obs;
  final menuItems = [
    {'name': 'BRUSCHETTA 1pz', 'price': '1.5'},
    {'name': 'CROCCHE\'', 'price': '1.5'}
  ].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    textPlaceholderController.dispose();
  }

  
}
