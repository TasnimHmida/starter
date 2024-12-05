import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/name_feature/models/example_model.dart';

part 'helpers/example_dto.g.dart';

@JsonSerializable()
class ExampleDto extends Equatable {
  final String? param1;
  final String? param2;

  @override
  const ExampleDto({
    this.param1,
    this.param2,
  });

  factory ExampleDto.fromJson(Map<String, dynamic> json) =>
      _$ExampleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleDtoToJson(this);

  factory ExampleDto.fromEntity(ExampleModel model) {
    return ExampleDto(
      param1: model.param1,
      param2: model.param2,
    );
  }

  ExampleModel toModel() {
    return ExampleModel(
      param1: param1,
      param2: param2,
    );
  }

  @override
  List<Object?> get props => [param1, param2];
}
