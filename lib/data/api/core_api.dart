import 'package:breaking_bad_app/data/models/from_api/api_dto.dart';
import 'package:dio/dio.dart';

class CoreApi {
  final Dio _dio = Dio();

  final baseUrl = 'https://www.breakingbadapi.com/api';

  String get actorsUrl => '$baseUrl/characters';

  Future<Options>? getHeaders() async {
    return Options(headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
  }

  Future<ApiDTO> getRequest(String url) async {
    ApiDTO? result;

    try {
      final headers = await getHeaders();
      final response = await _dio.get(
        url,
        options: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        result = ApiDTO<dynamic, dynamic>(response: response.data);
      } else {
        result = ApiDTO<dynamic, dynamic>(
            error: response.data!['detail'].toString());
      }
    } catch (e) {
      result = ApiDTO<dynamic, dynamic>(error: e);
    }
    return result;
  }

  Future<ApiDTO> postRequest(
    String url, {
    final body,
  }) async {
    ApiDTO? result;

    try {
      final headers = await getHeaders();
      final response = await _dio.post(
        url,
        data: body,
        options: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        result = ApiDTO<dynamic, dynamic>(response: response.data);
      } else {
        result = ApiDTO<dynamic, dynamic>(
            error: response.data!['detail'].toString());
      }
    } catch (e) {
      result = ApiDTO<dynamic, dynamic>(error: e);
    }
    return result;
  }
}
