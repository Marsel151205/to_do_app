import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/images.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/dimens.dart';
import '../widgets/LoginAction.dart';
import '../widgets/LoginField.dart';
import '../widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height200, width:double.infinity, child: logo),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: padding24,
                ).copyWith(top: padding24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeader(),
                    LoginField(),
                    LoginAction()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
