import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:to_do_app/core/di/injection_container.dart';
import 'package:to_do_app/core/local/storage/secury_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecuryStorageService _storage = getIt<SecuryStorageService>();

  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // Удаляем native splash screen после инициализации
    FlutterNativeSplash.remove();

    // Небольшая задержка для плавности
    await Future.delayed(const Duration(milliseconds: 500));

    // Проверяем наличие токенов
    final hasTokens = await _storage.hasTokens();

    if (!mounted) return;

    // Навигация в зависимости от наличия токенов
    if (hasTokens) {
      context.go('/main');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}