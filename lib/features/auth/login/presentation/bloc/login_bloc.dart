import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/login/data/login_repository.dart';
import 'package:to_do_app/features/auth/login/presentation/bloc/login_event.dart';
import 'package:to_do_app/features/auth/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(const Input('', '')) {
    on<LoginSubmitted>(_loginSubmitted);
  }

  Future<void> _loginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(const Loading());

    try {
      final response = await loginRepository.login(event.username, event.password);
      emit(Success(response));
    } catch (exception) {
      emit(ErrorState(exception.toString()));
    }
  }
}