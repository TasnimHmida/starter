import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'error/error_utils.dart';
import 'error/exception.dart';
import 'error/error_messages.dart';
import '../di/injection.dart';

Future<Either<Exception, T>> handleHttpRequest<T>({
  required Response response,
  required T Function(Map<String, dynamic>) handleResponse,
}) async {
  final networkInfo = getIt<InternetConnectionChecker>();
  if (!await networkInfo.hasConnection) {
    return Left(OfflineException(message: OFFLINE_FAILURE_MESSAGE));
  }
  try {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Handle 2xx Success
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      return Right(handleResponse(decodedJson));
    } else if (response.statusCode == 401) {
      return Left(UnauthorizedException(message: 'Unauthorized request'));
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      // Handle 4xx Client Errors
      final errorMessage = getErrorMessage(response);
      return Left(BadRequestException(message: errorMessage));
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      // Handle 5xx Server Errors
      return Left(ServerErrorException(message: SERVER_FAILURE_MESSAGE));
    } else {
      // Handle unknown status codes
      return Left(UnknownNetworkException(
        message:
            'Unknown error occurred with status code ${response.statusCode}',
      ));
    }
  } on FormatException catch (e) {
    return Left(ServerException(message: 'Invalid JSON format: ${e.message}'));
  } on SocketException catch (e) {
    return Left(NetworkException(message: 'Network error: ${e.message}'));
  } on Exception catch (e) {
    return Left(e);
  }
}
