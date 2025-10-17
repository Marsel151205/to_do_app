import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do_app/core/di/injection_container.dart';
import 'package:to_do_app/shared/widgets/primary_button.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_event.dart';

import '../../../../../shared/themes/colors.dart';
import '../../../../../shared/themes/dimens.dart';
import '../bloc/register_state.dart';
import '../widgets/register_fields.dart';
import '../widgets/register_header.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterBloc>(),
      child: const _RegistrationView(),
    );
  }
}

class _RegistrationView extends StatelessWidget {
  const _RegistrationView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    final topMargin = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage.toString())),
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: padding24,
                    ).copyWith(top: (topMargin + padding24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterHeader(),
                        RegisterFields(),
                        SizedBox(height: height40),
                        PrimaryButton(
                          onTap: () {
                            bloc.add(RegisterSubmitted());
                          },
                          labelText: state.isLoading ? 'Loading' : 'Register',
                        ),
                      ],
                    ),
                  ),
                  if(state.isLoading) 
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: black.withOpacity(0.4),
                      child: const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.deepPurple,
                          size: 60.0,
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
