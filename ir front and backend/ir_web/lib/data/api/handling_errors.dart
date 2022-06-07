import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

enum NetworkException {
  RequestCancelled,
  UnauthorisedRequest,
  BadRequest,
  NotFound,
  MethodNotAllowed,
  NotAcceptable,
  RequestTimeout,
  SendTimeout,
  Conflict,
  InternalServerError,
  NotImplemented,
  ServiceUnavailable,
  NoInternetConnection,
  FormatException,
  UnableToProcess,
  DefaultError,
  UnexpectedError,
}

class NetworkExceptions {
  final NetworkException networkException;
  final String? error;

  NetworkExceptions(this.networkException, {this.error});

  factory NetworkExceptions.requestCancelled() =>
      NetworkExceptions(NetworkException.RequestCancelled);

  factory NetworkExceptions.unauthorisedRequest() =>
      NetworkExceptions(NetworkException.UnauthorisedRequest);

  factory NetworkExceptions.badRequest() =>
      NetworkExceptions(NetworkException.BadRequest);

  factory NetworkExceptions.notFound(String error) =>
      NetworkExceptions(NetworkException.NotFound, error: error);

  factory NetworkExceptions.methodNotAllowed() =>
      NetworkExceptions(NetworkException.MethodNotAllowed);

  factory NetworkExceptions.notAcceptable() =>
      NetworkExceptions(NetworkException.NotAcceptable);

  factory NetworkExceptions.requestTimeout() =>
      NetworkExceptions(NetworkException.RequestTimeout);

  factory NetworkExceptions.sendTimeout() =>
      NetworkExceptions(NetworkException.SendTimeout);

  factory NetworkExceptions.conflict() =>
      NetworkExceptions(NetworkException.Conflict);

  factory NetworkExceptions.internalServerError() =>
      NetworkExceptions(NetworkException.InternalServerError);

  factory NetworkExceptions.notImplemented() =>
      NetworkExceptions(NetworkException.NotImplemented);

  factory NetworkExceptions.serviceUnavailable() =>
      NetworkExceptions(NetworkException.ServiceUnavailable);

  factory NetworkExceptions.noInternetConnection() =>
      NetworkExceptions(NetworkException.NoInternetConnection);

  factory NetworkExceptions.formatException() =>
      NetworkExceptions(NetworkException.FormatException);

  factory NetworkExceptions.unableToProcess() =>
      NetworkExceptions(NetworkException.UnableToProcess);

  factory NetworkExceptions.unexpectedError() =>
      NetworkExceptions(NetworkException.UnexpectedError);

  factory NetworkExceptions.defaultError(String error) =>
      NetworkExceptions(NetworkException.DefaultError, error: error);

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is dio.DioError) {
          switch (error.type) {
            case dio.DioErrorType.cancel:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case dio.DioErrorType.connectTimeout:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case dio.DioErrorType.other:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case dio.DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case dio.DioErrorType.response:
              switch (error.response!.statusCode!) {
                case 400:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions = NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case dio.DioErrorType.sendTimeout:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return NetworkExceptions.formatException();
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(error) {
    NetworkExceptions networkException =
        NetworkExceptions.getDioException(error);
    return _getMessage(networkException).tr;
  }

  static String _getMessage(NetworkExceptions networkException) {
    var errorMessage = "";
    switch (networkException.networkException) {
      case NetworkException.NotImplemented:
        errorMessage = "Not Implemented";
        break;
      case NetworkException.RequestCancelled:
        errorMessage = "Request Cancelled";
        break;
      case NetworkException.InternalServerError:
        errorMessage = "Internal Server Error";
        break;
      case NetworkException.ServiceUnavailable:
        errorMessage = "Service unavailable";
        break;
      case NetworkException.MethodNotAllowed:
        errorMessage = "Method Allowed";
        break;
      case NetworkException.BadRequest:
        errorMessage = "Bad request";
        break;
      case NetworkException.UnauthorisedRequest:
        errorMessage = "Unauthorised request";
        break;
      case NetworkException.UnexpectedError:
        errorMessage = "Unexpected error occurred";
        break;
      case NetworkException.RequestTimeout:
        errorMessage = "Connection request timeout";
        break;
      case NetworkException.NoInternetConnection:
        errorMessage = "No internet connection";
        break;
      case NetworkException.Conflict:
        errorMessage = "Error due to a conflict";
        break;
      case NetworkException.SendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      case NetworkException.UnableToProcess:
        errorMessage = "Unable to process the data";
        break;

      case NetworkException.FormatException:
        errorMessage = "Unexpected error occurred";
        break;

      case NetworkException.NotAcceptable:
        errorMessage = "Not acceptable";
        break;
      case NetworkException.DefaultError:
        errorMessage = "networkException.error!";
        break;
      default:
        errorMessage = "error";
        break;
    }
    return errorMessage;
  }
}
