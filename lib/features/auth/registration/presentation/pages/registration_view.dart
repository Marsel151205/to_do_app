import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';

import '../../../../../shared/themes/colors.dart';
import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../widgets/register_fields.dart';
import '../widgets/register_header.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
              if (state is Error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage.toString())),
                );
              } else if (state is Success) {
                context.go('/registration/main');
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
                        RegisterFields(
                          nameController: nameController,
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        ),
                        SizedBox(height: height40),
                        PrimaryButton(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${nameController.text}, ${emailController.text}'))
                            );
                            bloc.add(
                              RegisterSubmitted(
                                nameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                              ),
                            );
                          },
                          labelText: state is Loading ? 'Loading' : 'Register',
                        ),
                      ],
                    ),
                  ),
                  if (state is Loading)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: black.withOpacity(0.4),
                      child: const Center(
                        child: SpinKitRing(
                          color: Colors.deepPurple,
                          size: 60.0,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
