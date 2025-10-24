import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/login/data/login_repository.dart';
import 'package:to_do_app/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:to_do_app/features/auth/registration/data/auth_repository.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';

import '../local/storage/secury_storage.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerLazySingleton(() => ApiServices());

  // Registration
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiServices>(), getIt<SecuryStorageService>()),
  );
  getIt.registerFactory(() => RegisterBloc(getIt<AuthRepository>()));

  // Login
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(getIt<ApiServices>(), getIt<SecuryStorageService>()),
  );
  getIt.registerFactory(() => LoginBloc(getIt<LoginRepository>()));

  // Secury Storage
  getIt.registerLazySingleton(() => SecuryStorageService());
}
