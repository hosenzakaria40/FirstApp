import 'dart:convert';

import 'package:fast_app/All_Project/TaskManeger/data/auth_controller/auth_controller.dart';
import 'package:fast_app/All_Project/TaskManeger/data/models/api_response.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ApiCaller {
  final Logger _logger = Logger();

  Future<ApiResponse> getRequest({required String url }) async {
    try {
      Uri uri = Uri.parse(url);

      _logger.i(uri);
      Response response = await get(
        uri,
        headers: {
          'token':AuthController.token ?? '',
        },
      );
      _logger.i(response.body);
      if (response.statusCode == 200|| response.statusCode == 201) {
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
      _logger.i(uri);
      Response response = await post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token',
          'token':AuthController.token ?? '',
        },
        body: body != null ? jsonEncode(body) : null,
      );
      _logger.i(response.body);
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
