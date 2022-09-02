import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class EditTableService {
  late Dio _dio;

  final String baseUrl = "https://nspcompanyapi.tk/api/";
  final GetStorage nsp = GetStorage('NSP');

  EditTableService() {
    // String auth = 'bearer ' + nsp.read('access_token');
    // print(auth);
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': auth,
        },
      ),
    );
  }

  Future<Response> editTable({String? endPoint, List? data}) async {
    return await _dio.put(
      endPoint!,
      data: {
        'manhours_completed': data![0],
        'fatalities': data[1],
        'near_misses_reported': data[2],
        'lost_time_incident': data[3],
        'environmental_incidents': data[4],
        'first_aid_case': data[5],
        'emergency_drills': data[6],
        'c_manhours_completed': data[7],
        'c_fatalities': data[8],
        'c_near_misses_reported': data[9],
        'c_lost_time_incident': data[10],
        'c_environmental_incidents': data[11],
        'c_first_aid_case': data[12],
        'c_emergency_drills': data[13],
      },
    );
  }
}
