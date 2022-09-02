import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shiroro_ui/controllers/home_controller.dart';
import 'package:shiroro_ui/services/edit_table_service.dart';

class EditTableController {
  EditTableService? editTableService = EditTableService();
  HomeController homeController = Get.find();

  RxList errors = [].obs;
  RxString errorMessage = 'error'.obs;
  RxInt status = 100.obs;

  Future editTable(List? data) async {
    try {
      final response = await editTableService!.editTable(
        endPoint: 'iot/update/1',
        data: data,
      );
      homeController.manhoursCompleted.value =
          data![0] == "" ? homeController.manhoursCompleted.value : data[0];
      homeController.fatalities.value =
          data[1] == "" ? homeController.fatalities.value : data[1];
      homeController.nearMissesReported.value =
          data[2] == "" ? homeController.nearMissesReported.value : data[2];
      homeController.lostTimeIncident.value =
          data[3] == "" ? homeController.lostTimeIncident.value : data[3];
      homeController.environmentalIncidents.value =
          data[4] == "" ? homeController.environmentalIncidents.value : data[4];
      homeController.firstAidCase.value =
          data[5] == "" ? homeController.firstAidCase.value : data[5];
      homeController.emergencyDrills.value =
          data[6] == "" ? homeController.emergencyDrills.value : data[6];
      homeController.cumulativeManhoursCompleted.value = data[7] == ""
          ? homeController.cumulativeManhoursCompleted.value
          : data[7];
      homeController.cumulativeFatalities.value =
          data[8] == "" ? homeController.cumulativeFatalities.value : data[8];
      homeController.cumulativeNearMissesReported.value = data[9] == ""
          ? homeController.cumulativeNearMissesReported.value
          : data[9];
      homeController.cumulativeLostTimeIncident.value = data[10] == ""
          ? homeController.cumulativeLostTimeIncident.value
          : data[10];
      homeController.cumulativeEnvironmentalIncidents.value = data[11] == ""
          ? homeController.cumulativeEnvironmentalIncidents.value
          : data[11];
      homeController.cumulativeFirstAidCase.value = data[12] == ""
          ? homeController.cumulativeFirstAidCase.value
          : data[12];
      homeController.cumulativeEmergencyDrills.value = data[13] == ""
          ? homeController.cumulativeEmergencyDrills.value
          : data[13];

      status.value = json.decode(response.data)['status_code'];
      // print(json.decode(response.data));
    } on DioError catch (error) {
      errorMessage.value = json.decode(error.response!.data)['message'];
      errors.value = [json.decode(error.response!.data)['error']];
      status.value = json.decode(error.response!.data)['status_code'];
      // print(json.decode(error.response!.data)['message']);
    }
  }
}
