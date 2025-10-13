import 'package:flutter/cupertino.dart';

import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/widgets/text_field_widget.dart';

class LoginField extends StatelessWidget {
  const LoginField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height40),
        TextFieldWidget(
          labelText: 'Email Address',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: height16),
        TextFieldWidget(
          labelText: 'Password',
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}