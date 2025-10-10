import 'package:flutter/cupertino.dart';

import '../../../../../core/themes/dimens.dart';
import '../../../../../core/themes/text_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign Up', style: head2TextStyle),
        SizedBox(height: height8),
        Text('Create an account to get started ', style: body1TextStyle),
      ],
    );
  }
}
