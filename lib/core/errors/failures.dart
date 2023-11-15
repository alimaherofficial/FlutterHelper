import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zawj/core/utils/app_strings.dart';
import 'package:zawj/core/utils/extensions.dart';

/// this class is used to manage the failures
abstract class Failure {
  /// constructor
  const Failure(this.errMessage);

  /// error message
  final String errMessage;
}

///  this class is used to manage the server failures
/// it extends the [Failure] class
class ServerFailure extends Failure {
  /// constructor
  ServerFailure(super.errMessage);

  /// this method is used to get the failure from dio error
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badCertificate:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode,
          // ignore: avoid_dynamic_calls
          dioException.response!.data.runtimeType == String
              ? (dioException.response!.data as String).isValidJson
                  ? jsonDecode(dioException.response!.data.toString())
                  : 'Something went wrong'
              : dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          // return ServerFailure(S.current.noInternetConnection);
        }
        return ServerFailure('Unexpected Error, Please try again!');

      case DioExceptionType.unknown:
        return ServerFailure('Opps There was unknown Error ');
    }
  }

  /// this method is used to get the failure from response
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if ([400, 401, 403, 422, 404].contains(statusCode)) {
      final responseMap = response as Map<String, dynamic>;
      log('responseMap $responseMap', name: 'ServerFailure');
      if (statusCode == 401) {
        // Navigator.pushNamedAndRemoveUntil(
        //   navigatorKey.currentContext!,
        //   Routes.loginWithEmailRoute,
        //   (route) => false,
        // );
        // UserHelper.loginEntity.delete();
        // return ServerFailure('Opps There was an Error, Please Login again');
      }
      return ServerFailure(
        (responseMap['message'] as String?) == null
            ? // ? (responseMap['translation'] as String).isEmpty
            //     ?
            AppStrings.unexpectedError
            // : responseMap['translation'] as String
            : responseMap['message'] as String,
      );
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
