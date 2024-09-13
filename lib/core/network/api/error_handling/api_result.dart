import 'package:azkary/core/network/api/error_handling/api_error_model.dart';
import 'package:azkary/core/network/api/error_handling/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel errorHandler) = Failure<T>;
}
