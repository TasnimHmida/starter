part of 'name_bloc.dart';

class NameState extends Equatable {
  final NameStatus nameStatus;
  final String message;
  final ExampleModel? data;

  const NameState({
    this.message = "",
    this.nameStatus = NameStatus.loading,
    this.data,
  });

  NameState copyWith({
    NameStatus? nameStatus,
    String? message,
    ExampleModel? data,
  }) {
    return NameState(
      nameStatus: nameStatus ?? this.nameStatus,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
    nameStatus,
    message,
    data,
  ];
}

enum NameStatus {loading, success, error}