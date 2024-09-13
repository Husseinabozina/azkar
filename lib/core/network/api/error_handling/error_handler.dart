import 'package:azkary/core/network/api/error_handling/api_error_model.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
              message:
                  "Failed to connect to the server. Please check your internet connection.");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request canceled by the user.");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              message: "Connection timed out. Please try again later.");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message: "An unexpected error occurred. Please try again later.");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message:
                  "Server failed to send data in time. Please try again later.");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.statusCode, error);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message:
                  "Failed to send data to the server. Please try again later.");
        default:
          return ApiErrorModel(message: "An unexpected error occurred.");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error occurred.");
    }
  }

  static ApiErrorModel _handleError(int? statusCode, dynamic error) {
    return ApiErrorModel(
      message: error['message'] ?? "Unknown error occured",
      code: statusCode,
    );
  }
}
