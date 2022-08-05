import 'package:dio/dio.dart';

class HomeService {
  late Dio _dio;

  final String baseUrl = "http://api.nspcompany.tk/public/api/";

  HomeService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Future<Response> getDatas(String endPoint) async {
    // Response response;
    // try {
    //   response = await _dio.get(endPoint);
    //   // print(response);
    // } on DioError catch (error) {
    //   print(error.message);
    //   throw Exception(error.message);
    // }

    return await _dio.get(endPoint);
  }

  // headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': auth,
  //     },
  //     body: body,
  // dio.options.headers["Authorization"] = "Bearer ${token}";

}
