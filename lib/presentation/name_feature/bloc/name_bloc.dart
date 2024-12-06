import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../core/network/error/error_utils.dart';
import '../../../domain/name_feature/models/example_model.dart';
import '../../../domain/name_feature/repositories/feature_name_repository.dart';

part 'name_event.dart';

part 'name_state.dart';

@injectable
class NameBloc extends Bloc<NameEvent, NameState> {
  final NameFeatureRepository nameFeatureRepository;

  NameBloc(this.nameFeatureRepository) : super(const NameState()) {
    on<CreateNameEvent>(_onCreateNameEvent);
    on<ReadNameEvent>(_onReadNameEvent);
    on<UpdateNameEvent>(_onUpdateNameEvent);
    on<DeleteNameEvent>(_onDeleteNameEvent);
  }

  void _onCreateNameEvent(
      CreateNameEvent event, Emitter<NameState> emit) async {
    emit(state.copyWith(nameStatus: NameStatus.loading));

    try {
      await nameFeatureRepository.create(event.data);
      emit(state.copyWith(nameStatus: NameStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
        nameStatus: NameStatus.error,
        message: mapExceptionToMessage(e),
      ));
    }
  }

  void _onReadNameEvent(ReadNameEvent event, Emitter<NameState> emit) async {
    emit(state.copyWith(nameStatus: NameStatus.loading));

    try {
      final data = await nameFeatureRepository.read(event.id);
      emit(state.copyWith(
        nameStatus: NameStatus.success,
        data: data,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        nameStatus: NameStatus.error,
        message: mapExceptionToMessage(e),
      ));
    }
  }

  void _onUpdateNameEvent(
      UpdateNameEvent event, Emitter<NameState> emit) async {
    emit(state.copyWith(nameStatus: NameStatus.loading));

    try {
      await nameFeatureRepository.update(event.id, event.data);
      emit(state.copyWith(nameStatus: NameStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
        nameStatus: NameStatus.error,
        message: mapExceptionToMessage(e),
      ));
    }
  }

  void _onDeleteNameEvent(
      DeleteNameEvent event, Emitter<NameState> emit) async {
    emit(state.copyWith(nameStatus: NameStatus.loading));

    try {
      await nameFeatureRepository.delete(event.id);
      emit(state.copyWith(nameStatus: NameStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(
        nameStatus: NameStatus.error,
        message: mapExceptionToMessage(e),
      ));
    }
  }
}
