import 'dart:convert';

import 'api_result.dart';


class DefaultResponse<T> with ApiResult<T> {
  DefaultResponse({
    this.data,
    this.status,
    this.message,
  }) {
    super.type = ApiResultType.success;
    super.data = data;
    super.message=message;
  }

  final T? data;
  final bool? status;
  final String? message;

  factory DefaultResponse.fromRawJson(String str) => DefaultResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DefaultResponse.fromJson(Map<String, dynamic> json) => DefaultResponse(
        data: json["data"] == null ? null : json["data"],
        status: json["status"] == null ? null : json["status"] == 1,
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
      };
}
