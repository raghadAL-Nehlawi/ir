import 'dart:convert';

import 'api_result.dart';


class ErrorResponse<T> with ApiResult<T> {
  final Map<String, dynamic>? errors;
  final bool? status;
  final String? message;

  ErrorResponse({
    this.errors,
    this.status,
    this.message,
  }) {
    super.type = ApiResultType.failure;
    super.message = message;
 //   super.errors = errors;
  }

  factory ErrorResponse.fromRawJson(String str) => ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> jsonFrom) => ErrorResponse(
         errors: jsonFrom["errors"] == null ? null : jsonFrom['errors'],
        status: jsonFrom["status"] == null ? null : jsonFrom["status"],
        message: jsonFrom["message"] == null ? null : jsonFrom["message"],
      );

  Map<String, dynamic> toJson() => {
        "errors": errors == null ? null : errors,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
