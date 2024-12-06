import 'package:injectable/injectable.dart';
import '../../../domain/name_feature/models/example_model.dart';
import '../../../domain/name_feature/repositories/feature_name_repository.dart';
import '../../name_feature/data_sources/remote/name_feature_remote_data_source.dart';

@injectable
class NameFeatureRepositoryImpl implements NameFeatureRepository {
  final NameFeatureRemoteDataSource remoteDataSource;

  NameFeatureRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<void> create(ExampleModel data) async {
    // Perform the network request to create
    final response = await remoteDataSource.create(data);
    response.fold(
          (exception) {
        // Handle the exception
        throw exception;
      },
          (success) {
        // Handle successful response
        // Optionally return success if needed
      },
    );
  }

  @override
  Future<ExampleModel> read(String id) async {
    // Perform the network request to read
    final response = await remoteDataSource.read(id);
    return response.fold(
          (exception) {
        // Handle the exception
        throw exception;
      },
          (success) {
        // Handle successful response
        return success;
      },
    );
  }

  @override
  Future<void> update(String id, ExampleModel data) async {
    // Perform the network request to update
    final response = await remoteDataSource.update(id, data);
    response.fold(
          (exception) {
        // Handle the exception
        throw exception;
      },
          (success) {
        // Handle successful response
        // Optionally return success if needed
      },
    );
  }

  @override
  Future<void> delete(String id) async {
    // Perform the network request to delete
    final response = await remoteDataSource.delete(id);
    response.fold(
          (exception) {
        // Handle the exception
        throw exception;
      },
          (success) {
        // Handle successful response
        // Optionally return success if needed
      },
    );
  }
}
