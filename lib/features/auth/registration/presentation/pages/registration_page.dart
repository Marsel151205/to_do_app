import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/di/injection_container.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';
import 'package:to_do_app/features/auth/registration/presentation/pages/registration_view.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterBloc>(),
      child: const RegistrationView(),
    );
  }
}
