import 'package:to_do_app/features/auth/registration/presentation/bloc/register_event.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.authRepository) : super(const Action('', '', '')) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  final AuthRepository authRepository;

  registerSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) {
    emit(state);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const Loading());

    try {
      final response = await authRepository.registration(
        event.name,
        event.email,
        event.password,
      );
      emit(Success(response));
    } catch (exception) {
      emit(Error(exception.toString()));
    }
  }
}
