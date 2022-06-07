
import 'default_response.dart';
import 'error_response.dart';

enum ApiResultType {success , failure}

abstract class ApiResult<T>{
  ApiResultType? type;
  T? data;
  String? message;
 // Map<String,dynamic>? errors;

  factory ApiResult.success(T data,String message) => DefaultResponse<T>(data: data,message: message);

  factory ApiResult.successFromJson(Map<String, dynamic> json) => DefaultResponse<T>(
    data: json["data"] == null ? null : json["data"],
    status: json["status"] == null ? null : json["status"] == 1,
    message: json["message"] == null ? null : json["message"] ,
  );

   factory ApiResult.failure(String error) => ErrorResponse(message: error,);
  //factory ApiResult.failure(String error,{Map<String,String> errors}) => ErrorResponse<T>(message: error,errors: errors);

  factory ApiResult.failureFromJson(Map<String, dynamic> jsonFrom) => ErrorResponse<T>(
    // errors: jsonFrom["errors"] == null ? null : jsonFrom['errors'],
   // errors: null,
    status: jsonFrom["status"] == null ? null : jsonFrom["status"] == 1,
    message: jsonFrom["message"] == null ? null : jsonFrom["message"],
  );


}