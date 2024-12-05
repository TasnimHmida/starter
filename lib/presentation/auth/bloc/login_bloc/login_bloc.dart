import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_utils.dart';
import '../../../../domain/auth/repositories/auth_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<LoginUserEvent>(_onLoginUserEvent);
  }

  void _onLoginUserEvent(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading, message: ''));

    try {
      await authRepository.login(event.email,event.password);
      emit(state.copyWith(loginStatus: LoginStatus.success,));
    } on Exception catch (e) {
      emit(state.copyWith(
        message: mapExceptionToMessage(e),
        loginStatus: LoginStatus.error,
      ));
    }
  }
}
