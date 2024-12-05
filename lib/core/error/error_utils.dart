import 'dart:convert';
import 'package:http/http.dart';
import '../network/network_info.dart';
import 'exception.dart';
import 'package:dartz/dartz.dart';

String mapExceptionToMessage(Exception e) {
  if (e is ServerException) {
    return e.message;
  } else if (e is UnauthorizedException) {
    return e.message;
  } else if (e is BadRequestException) {
    return e.message;
  } else if (e is UnknownNetworkException) {
    return e.message;
  } else if (e is ServerErrorException) {
    return e.message;
  } else if (e is NetworkException) {
    return e.message;
  } else {
    return 'Unknown error occurred';
  }
}

String _getErrorMessage(Response response) {
  try {
    final Map<String, dynamic> decodedJson = json.decode(response.body);
    return decodedJson['message'] ?? 'An unknown error occurred';
  } catch (e) {
    return 'Failed to parse error message';
  }
}

