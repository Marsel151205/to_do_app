import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/di/injection_container.dart';
import 'package:to_do_app/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:to_do_app/features/auth/login/presentation/pages/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(), 
      child: const LoginView()
      );
  }
}
