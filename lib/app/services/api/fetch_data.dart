import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response hide FormData;
import 'package:mobile/app/services/api/api.dart';
import 'package:mobile/app/services/api/api_exception.dart';
import 'package:mobile/app/services/api/request_method.dart';
import 'package:mobile/app/services/api/source/api_response.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/app_token.dart';
import 'package:mobile/utils/show_alert.dart';

Future<ApiResponse<T>> fetchData<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
  Map<String, String>? header,
  Map<String, dynamic>? queryParameters,
  String? baseUrl,
  bool isRegist = false,
}) async {
  try {
    final api = await Api(
      isFormData: data is FormData,
      baseUrl: baseUrl,
      isRegist: isRegist,
    );

    Response request = await api.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method.value),
    );

    if (T == dynamic) {
      return ApiResponse.fromJson(request.data);
    }

    ApiResponse<T> response = ApiResponse.fromJson(request.data);
    return response;
  } catch (e) {
    if (e is DioException) {
      final response = e.response;

      if (isAlert!) {
        if (response?.data is Map) {
          String message =
              response?.data['message'] ?? 'Unknown Errors Occurred';
          if (message.toLowerCase().contains("token")) {
            logoutHandler();
          } else {
            showAlert(message);
          }
        } else {
          showAlert(response?.statusMessage ?? e.message ?? e.toString());
        }
      }
      throw ApiException(
        response?.data?['message'] ??
            response?.statusMessage ??
            e.message ??
            e.toString(),
        code: response?.statusCode,
      );
    }
    if (isAlert!) {
      showAlert(e.toString());
    }
    rethrow;
  }
}

Future<ApiResponses<T>> fetchMultipleData<T>({
  required String url,
  required RequestMethod method,
  Object? data,
  bool? isAlert = true,
  Map<String, dynamic>? queryParameters,
  String? baseUrl,
  bool isRegist = false,
}) async {
  try {
    final api = await Api(
      baseUrl: baseUrl,
      isFormData: data is FormData,
      isRegist: isRegist,
    );
    Response request = await api.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(method: method.value),
    );

    if (T == dynamic) {
      return ApiResponses.fromJson(request.data);
    }

    ApiResponses<T> response = ApiResponses.fromJson(request.data);
    return response;
  } catch (e) {
    if (e is DioException) {
      final response = e.response;

      if (isAlert!) {
        if (response?.data is Map) {
          String message = response?.data['message'] ?? 'Unknown';
          if (message.toLowerCase().contains("token")) {
            logoutHandler();
          } else {
            showAlert(message);
          }
        } else {
          showAlert(response?.statusMessage ?? e.message ?? e.toString());
        }
      }
      throw ApiException(
        response?.data?['message'] ??
            response?.statusMessage ??
            e.message ??
            e.toString(),
        code: response?.statusCode,
      );
    }
    if (isAlert!) {
      showAlert(e.toString());
    }
    rethrow;
  }
}

void logoutHandler() async {
  await UserToken.clearToken();
  Get.offAllNamed(AppRoute.onboarding);
}
