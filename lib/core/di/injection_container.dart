import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/registration/data/auth_repository.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';

final getIt = GetIt.instance;

void setupInjection() {

  getIt.registerLazySingleton(() => ApiServices());

  // Auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<ApiServices>())); 
  getIt.registerFactory(() => RegisterBloc(getIt<AuthRepository>()));
}