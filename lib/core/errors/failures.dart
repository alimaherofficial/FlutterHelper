// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helper/generated/l10n.dart';

class Failure implements Exception {
  Failure(this.errMessage, this.errType);

  factory Failure.fromObject(dynamic e) {
    if (e is Exception) {
      return Failure.fromException(e);
    } else {
      return RegularFailure.fromException(Exception(e.toString()));
    }
  }

  factory Failure.fromException(Exception e) {
    switch (e.runtimeType) {
      case FirebaseException:
        return FirebaseFailure.fromFirebaseException(e as FirebaseException);
      // case (PostgrestException || AuthException || AuthApiException):
      //   return SupabaseFailure.fromSupabaseError(e);
      case DioException:
        return DioFailure.fromDioError(e as DioException);
      default:
        return RegularFailure.fromException(e);
    }
  }

  final String errMessage;

  final String errType;

  @override
  String toString() {
    return 'Failure: $errMessage';
  }
}

// class SupabaseFailure extends Failure {
//   SupabaseFailure(String errMessage) : super(errMessage, 'Supabase Exception');

//   factory SupabaseFailure.fromSupabaseError(Exception e) {
//     switch (e.runtimeType) {
//       case PostgrestException:
//         return SupabaseFailure.fromSupabasePostgrestException(
//           e as PostgrestException,
//         );
//       case AuthException:
//         return SupabaseFailure.fromAuthException(e as AuthException);

//       case AuthApiException:
//         return SupabaseFailure.fromAuthApiException(e as AuthApiException);
//       default:
//         return SupabaseFailure(e.toString());
//     }
//   }

//   factory SupabaseFailure.fromSupabasePostgrestException(PostgrestException e) {
//     return SupabaseFailure(e.message);
//   }

//   factory SupabaseFailure.fromAuthException(AuthException e) {
//     return SupabaseFailure(e.message);
//   }

//   factory SupabaseFailure.fromAuthApiException(AuthApiException e) {
//     return SupabaseFailure(e.message);
//   }

//   @override
//   String toString() {
//     return 'SupabaseFailure: $errMessage';
//   }
// }

class FirebaseFailure extends Failure {
  FirebaseFailure(String errMessage) : super(errMessage, 'Firebase Exception');

  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    return FirebaseFailure(e.message ?? 'An error occurred');
  }

  @override
  String toString() {
    return 'FirebaseFailure: $errMessage';
  }
}

class DioFailure extends Failure {
  DioFailure(String errMessage) : super(errMessage, 'Dio Exception');

  factory DioFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(S.current.connectionTimeoutWithApiserver);
      case DioExceptionType.sendTimeout:
        return DioFailure(S.current.sendTimeoutWithApiserver);
      case DioExceptionType.receiveTimeout:
        return DioFailure(S.current.receiveTimeoutWithApiserver);
      case DioExceptionType.badCertificate:
        return DioFailure(S.current.badCertificateWithApiserver);
      case DioExceptionType.badResponse:
        return DioFailure('Bad response from ApiServer');
      case DioExceptionType.cancel:
        return DioFailure(S.current.requestToApiserverWasCanceled);
      case DioExceptionType.connectionError:
        if (e.message!.contains('SocketException')) {
          return DioFailure(S.current.noInternetConnection);
        }
        return DioFailure(S.current.unexpectedErrorPleaseTryAgain);

      case DioExceptionType.unknown:
        return DioFailure(S.current.unknownErrorWithApiserver);
    }
  }

  factory DioFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 401) {
      return DioFailure(S.current.oppsThereWasAnErrorPleaseLoginAgain);
    }
    if ([400, 403, 422, 404].contains(statusCode)) {
      final responseMap = response as Map<String, dynamic>;

      return DioFailure(
        responseMap['message'] as String? ??
            S.current.unexpectedErrorPleaseTryAgain,
      );
    } else if (statusCode == 500) {
      return DioFailure(S.current.internalServerErrorPleaseTryLater);
    } else {
      return DioFailure(S.current.oppsThereWasAnErrorPleaseTryAgain);
    }
  }

  @override
  String toString() {
    return 'DioFailure: $errMessage';
  }
}

class RegularFailure extends Failure {
  RegularFailure(String errMessage) : super(errMessage, 'Regular Exception');

  factory RegularFailure.fromException(Exception e) {
    return RegularFailure(e.toString());
  }

  @override
  String toString() {
    return 'RegularFailure: $errMessage';
  }
}
