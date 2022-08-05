import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shiroro_ui/services/register_service.dart';

class RegisterController {
  RegisterService? registerService = RegisterService();

  RxList errors = [].obs;
  RxInt status = 100.obs;

  Future register({String? name, String? email, String? password}) async {
    try {
      final response = await registerService!.register(
        endPoint: 'signup',
        name: name,
        email: email,
        password: password,
      );
      status.value = json.decode(response.data)['status_code'];
      // print(json.decode(response.data));
    } on DioError catch (error) {
      errors.value = json.decode(error.response!.data)['errors'];
      status.value = json.decode(error.response!.data)['status_code'];
      // print("status " + status.toString());
    }
  }
}
