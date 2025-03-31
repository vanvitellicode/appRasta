import 'package:get/get.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:rms/data/models/selectionPopupModel/ListItineraryFromGetRepoModel.dart';
import 'package:rms/data/models/selectionPopupModel/selection_popup_model.dart';

class SessionInfoModel {
  Rx<ListItineraryFromGetRepoModel> listItineraryFromGetRepoModel = ListItineraryFromGetRepoModel().obs;
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "First Vehicle".tr,
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Second Vehicle".tr,
    ),
    SelectionPopupModel(
      id: 3,
      title: "Third Vehicle".tr,
    )
  ]);


  Rx<List<SelectionPopupModel>> dropdownTimeItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "00:15".tr,
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "00:30".tr,
    ),
    SelectionPopupModel(
      id: 3,
      title: "00:45".tr,
    ),
    SelectionPopupModel(
      id: 4,
      title: "01:00".tr,
    ),
    SelectionPopupModel(
      id: 5,
      title: "01:15".tr,
    ),
    SelectionPopupModel(
      id: 6,
      title: "01:30".tr,
    ),
    SelectionPopupModel(
      id: 7,
      title: "01:45".tr,
    ),
    SelectionPopupModel(
      id: 8,
      title: "02:00".tr,
    ),
    SelectionPopupModel(
      id: 9,
      title: "02:15".tr,
    ),
    SelectionPopupModel(
      id: 10,
      title: "02:30".tr,
    ),
    SelectionPopupModel(
      id: 11,
      title: "02:45".tr,
    ),
    SelectionPopupModel(
      id: 12,
      title: "03:00".tr,
    ),
    SelectionPopupModel(
      id: 13,
      title: "03:15".tr,
    ),
    SelectionPopupModel(
      id: 14,
      title: "03:30".tr,
    ),
    SelectionPopupModel(
      id: 15,
      title: "03:45".tr,
    ),
    SelectionPopupModel(
      id: 16,
      title: "04:00".tr,
    ),
    SelectionPopupModel(
      id: 17,
      title: "04:15".tr,
    ),
    SelectionPopupModel(
      id: 18,
      title: "04:30".tr,
    ),
    SelectionPopupModel(
      id: 19,
      title: "04:45".tr,
    ),
    SelectionPopupModel(
      id: 20,
      title: "05:00".tr,
    ),
    SelectionPopupModel(
      id: 21,
      title: "05:15".tr,
    ),
    SelectionPopupModel(
      id: 22,
      title: "05:30".tr,
    ),
    SelectionPopupModel(
      id: 23,
      title: "05:45".tr,
    ),
    SelectionPopupModel(
      id: 24,
      title: "06:00".tr,
    ),
    

  ]);








  List<ValueItem<String>> selectableInterest = [
    ValueItem(label: "museums", value: "museums"),
    ValueItem(label: "green", value: "Green Areas"),
    ValueItem(label: "HistoricalSites", value: "Historical Sites"),
    ValueItem(label: "entertainment ", value: "Entertainment "),

    ];
}
