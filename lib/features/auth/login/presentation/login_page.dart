import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/themes/images.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/dimens.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_text_button.dart';
import '../../../../core/widgets/rich_text_button.dart';
import '../../../../core/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(height: height200, width:double.infinity, child: logo),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding24,
              ).copyWith(top: padding24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign In', style: head2TextStyle),
                  SizedBox(height: height8),
                  Text(
                    'Log in to your account to get started',
                    style: body1TextStyle,
                  ),
                  SizedBox(height: height60),
                  TextFieldWidget(
                    labelText: 'Email Address',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height16),
                  TextFieldWidget(
                    labelText: 'Password',
                    inputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: height16),
                  PrimaryTextButton(
                    onTap: () {},
                    labelText: 'Forgot Password?',
                  ),
                  SizedBox(height: height24),
                  PrimaryButton(onTap: () {}, labelText: 'Login'),
                  SizedBox(height: height16),
                  Center(
                    child: RichTextButton(
                      onTap: () { context.go('/login/registration'); },
                      textSpans: [
                        TextSpan(text: 'Not a member?', style: body1TextStyle),
                        TextSpan(
                          text: ' Register now',
                          style: action1TextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
