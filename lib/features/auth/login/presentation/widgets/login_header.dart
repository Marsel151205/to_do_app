import 'package:flutter/cupertino.dart';

import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/themes/text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign In', style: head2TextStyle),
        SizedBox(height: height8),
        Text(
          'Log in to your account to get started',
          style: body1TextStyle,
        ),
      ],
    );
  }
}