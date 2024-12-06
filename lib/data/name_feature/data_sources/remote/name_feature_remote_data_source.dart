import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/handle_http_request.dart';
import '../../../../core/network/interceptor/HttpInterceptor.dart';
import '../../../../domain/name_feature/models/example_model.dart';
import '../../dtos/example_dto.dart';

@injectable
class NameFeatureRemoteDataSource {
  final HttpInterceptor httpClient;

  NameFeatureRemoteDataSource({
    required this.httpClient,
  });

  Future<Either<Exception, Unit>> create(ExampleModel data) async {
    final Response response = await httpClient.httpInterceptor().post(
      Uri.parse("NameFeature/create"),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    return handleHttpRequest(
      response: response,
      handleResponse: (_) {
        return unit;
      },
    );
  }

  Future<Either<Exception, ExampleModel>> read(String id) async {
    final Response response = await httpClient.httpInterceptor().get(
      Uri.parse("NameFeature/read/$id"),
    );
    return handleHttpRequest(
      response: response,
      handleResponse: (response) {
        return ExampleDto.fromJson(json as Map<String, dynamic>).toModel();
      },
    );
  }

  Future<Either<Exception, Unit>> update(
      String id, ExampleModel data) async {
    final Response response = await httpClient.httpInterceptor().put(
      Uri.parse("NameFeature/update/$id"),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );
    return handleHttpRequest(
      response: response,
      handleResponse: (_) {
        return unit;
      },
    );
  }

  Future<Either<Exception, Unit>> delete(String id) async {
    final Response response = await httpClient.httpInterceptor().delete(
      Uri.parse("NameFeature/delete/$id"),
    );
    return handleHttpRequest(
      response: response,
      handleResponse: (_) {
        return unit;
      },
    );
  }
}
