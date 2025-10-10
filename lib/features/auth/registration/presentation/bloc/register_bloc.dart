import 'package:to_do_app/features/auth/registration/presentation/bloc/register_event.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(this.authRepository) : super(const RegisterState()) {
    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      try {
        final response = await authRepository.registration(
          state.name,
          state.email,
          state.password,
        );

        if (response) {
          emit(state.copyWith(isLoading: false));
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: 'Invalidate Credentials',
            ),
          );
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    });
  }
}
