// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shiroro_ui/models/data_model.dart';
import 'package:shiroro_ui/models/home_model.dart';
import 'package:shiroro_ui/services/home_service.dart';

class HomeController extends GetxController {
  HomeService? homeService = HomeService();
  HomeModel? homeModel;
  DataModel? dataModel;

  final GetStorage nsp = GetStorage('NSP');

  RxList errors = [].obs;
  RxBool isLoading = true.obs;
  RxString accessToken = 'null'.obs;

  RxString manhoursCompleted = '00'.obs;
  RxString fatalities = '00'.obs;
  RxString nearMissesReported = '00'.obs;
  RxString lostTimeIncident = '00'.obs;
  RxString environmentalIncidents = '00'.obs;
  RxString firstAidCase = '00'.obs;
  RxString emergencyDrills = '00'.obs;

  RxString cumulativeManhoursCompleted = '0000'.obs;
  RxString cumulativeFatalities = '0000'.obs;
  RxString cumulativeNearMissesReported = '0000'.obs;
  RxString cumulativeLostTimeIncident = '0000'.obs;
  RxString cumulativeEnvironmentalIncidents = '0000'.obs;
  RxString cumulativeFirstAidCase = '0000'.obs;
  RxString cumulativeEmergencyDrills = '0000'.obs;

  RxString day = '00'.obs;
  RxString month = '00'.obs;
  RxString year = '00'.obs;
  RxString hour = '00'.obs;
  RxString minute = '00'.obs;

  Future getDatas() async {
    try {
      final response = await homeService!.getDatas("iot/get");
      dataModel = DataModel.fromJson(json.decode(response.data)['data']);
      manhoursCompleted.value = dataModel!.manhours_completed!;
      fatalities.value = dataModel!.fatalities!;
      nearMissesReported.value = dataModel!.near_misses_reported!;
      lostTimeIncident.value = dataModel!.lost_time_incident!;
      environmentalIncidents.value = dataModel!.environmental_incidents!;
      firstAidCase.value = dataModel!.first_aid_case!;
      emergencyDrills.value = dataModel!.emergency_drills!;

      String time = dataModel!.time!;
      day.value = time[8] + time[9];
      month.value = time[5] + time[6];
      year.value = time[2] + time[3];
      minute.value = time[14] + time[15];
      hour.value = (int.parse(time[11] + time[12]) + 1).toString();
      // print(minute);
    } on DioError catch (error) {
      print(error);
    }
  }

  bool checkAuth() {
    if (nsp.read('access_token') == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getDatas();

    manhoursCompleted.value = dataModel!.manhours_completed!;
    fatalities.value = dataModel!.fatalities!;
    nearMissesReported.value = dataModel!.near_misses_reported!;
    lostTimeIncident.value = dataModel!.lost_time_incident!;
    environmentalIncidents.value = dataModel!.environmental_incidents!;
    firstAidCase.value = dataModel!.first_aid_case!;
    emergencyDrills.value = dataModel!.emergency_drills!;

    String time = dataModel!.time!;
    day.value = time[8] + time[9];
    month.value = time[5] + time[6];
    year.value = time[2] + time[3];
    minute.value = time[14] + time[15];
    hour.value = (int.parse(time[11] + time[12]) + 1).toString();

    accessToken.value = nsp.read('access_token') ?? 'null';
  }
}
