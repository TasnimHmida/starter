import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/handle_http_request.dart';
import '../../../../core/network/interceptor/HttpInterceptor.dart';
import '../../../../core/network/network_info.dart';
import '../local/pref_utils/auth_prefutils.dart';

@injectable
class AuthRemoteDataSource {
  final HttpInterceptor httpClient;
  final NetworkInfo networkInfo;

  AuthRemoteDataSource({
    required this.httpClient,
    required this.networkInfo,
  });

  Future<Either<Exception, Unit>> register(
      Map<String, dynamic> userInfo) async {
    final body = json.encode(userInfo);
    const String baseUrl = "BASE_URL"; // Replace with your actual base URL
    final Response response = await httpClient.httpInterceptor().post(
          Uri.parse(baseUrl),
          headers: {"Content-Type": "application/json"},
          body: body,
        );
    return await handleHttpRequest(
      response: response,
      handleResponse: (_) => unit,
    );
  }

  Future<Either<Exception, Map<String, dynamic>>> login(
      String email, String password) async {
    final body = json.encode({"email": email, "password": password});
    const String baseUrl = "BASE_URL"; // Replace with your actual base URL
    final Response response = await httpClient.httpInterceptor().post(
          Uri.parse(baseUrl),
          headers: {"Content-Type": "application/json"},
          body: body,
        );

    return await handleHttpRequest(
      response: response,
      handleResponse: (responseJson) {
        final Map<String, dynamic> data = responseJson['data']?['tokens'];
        if (data.isNotEmpty) {
          return data;
        } else {
          throw Exception("Login failed: no tokens found");
        }
      },
    );
  }

  Future<Either<Exception, Unit>> logout() async {
    final Response response = await httpClient.httpInterceptor().delete(
          Uri.parse("auth/logout"),
        );
    return await handleHttpRequest(
      response: response,
      handleResponse: (_) {
        return unit;
      },
    );
  }
}
