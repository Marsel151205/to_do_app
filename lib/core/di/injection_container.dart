import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/network/api_services.dart';
import 'package:to_do_app/features/auth/registration/data/auth_repository.dart';
import 'package:to_do_app/features/auth/registration/data/auth_service.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';

final getIt = GetIt.instance;

void setupInjection() {

  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://boxy-jxyk.onrender.com/',
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {'Content-Type': 'application/json'}
      )
    );

    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return dio;
  });

  getIt.registerLazySingleton(() => ApiServices(getIt<Dio>()));

  // Auth
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<ApiServices>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<AuthService>())); 
  getIt.registerFactory(() => RegisterBloc(getIt<AuthRepository>()));
}