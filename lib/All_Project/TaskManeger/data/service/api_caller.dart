import 'dart:convert';

import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ApiCaller {
  final Logger logger = Logger();

  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(
        uri,
        headers: {
          'Accept': 'application/json',
          // 'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
          'token': '',
        },
      );
      logger.d(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: true,
        );
      } else {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: false,
          errorMessage: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
          'token': '',
        },
        body: body != null ? jsonEncode(body) : null,
      );
      logger.d(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: true,
        );
      } else {
        return ApiResponse(
          responseCode: response.statusCode,
          responseData: jsonDecode(response.body),
          isSuccess: false,
          errorMessage: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
