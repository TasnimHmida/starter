import 'package:flutter_starter/domain/name_feature/models/example_model.dart';

abstract class NameFeatureRepository {
  Future<void> create(ExampleModel model);
  Future<ExampleModel> read(String id);
  Future<void> update(String id, ExampleModel model);
  Future<void> delete(String id);
}
