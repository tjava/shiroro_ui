import 'package:dio/dio.dart';

class RegisterService {
  late Dio _dio;

  final String baseUrl = "http://api.nspcompany.tk/public/api/";

  RegisterService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Future<Response> register(
      {String? endPoint, String? name, String? email, String? password}) async {
    return await _dio.post(
      endPoint!,
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
  }
}
