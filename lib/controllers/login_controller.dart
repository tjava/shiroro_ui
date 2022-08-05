import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shiroro_ui/services/login_service.dart';

class LoginController {
  LoginService? loginService = LoginService();
  final GetStorage nsp = GetStorage('NSP');

  RxList errors = [].obs;
  RxInt status = 100.obs;

  Future login({String? email, String? password}) async {
    try {
      final response = await loginService!.login(
        endPoint: 'login',
        email: email,
        password: password,
      );
      status.value = json.decode(response.data)['status_code'];
      nsp.write(
          'access_token', json.decode(response.data)['data']['access_token']);
      // print(json.decode(response.data));
    } on DioError catch (error) {
      errors.value = json.decode(error.response!.data)['errors'];
      status.value = json.decode(error.response!.data)['status_code'];
      // print("errors " + errors.toString());
      // print("status " + status.toString());
      // print(error);
    }
  }
}
