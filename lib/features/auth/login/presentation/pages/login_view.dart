import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../shared/themes/colors.dart';
import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/themes/images.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/login_action.dart';
import '../widgets/login_field.dart';
import '../widgets/login_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage.toString())),
                );
              } else if (state is Success) {
                context.go('/main');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Вы успешно прошли авторизацию!')),
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(radius12),
                        child: logo
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: padding24,
                        ).copyWith(top: padding24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginHeader(),
                            LoginField(
                              nameController: nameController,
                              passwordController: passwordController,
                            ),
                            LoginAction(
                              onTap: () {
                                bloc.add(
                                  LoginSubmitted(
                                    nameController.text,
                                    passwordController.text,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (state is Loading)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: black.withOpacity(0.4),
                      child: SpinKitRing(color: colorPrimary, size: 60),
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
