import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/themes/dimens.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/primary_text_button.dart';
import '../../../../../core/widgets/rich_text_button.dart';


class LoginAction extends StatelessWidget {
  const LoginAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}