import 'package:dio/dio.dart';

class LoginService {
  late Dio _dio;

  final String baseUrl = "https://nspcompanyapi.tk/api/";

  LoginService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Future<Response> login(
      {String? endPoint, String? email, String? password}) async {
    return await _dio.post(
      endPoint!,
      data: {
        "email": email,
        "password": password,
      },
    );
  }
}
