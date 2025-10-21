
import 'package:flutter/material.dart';

import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/widgets/text_field_widget.dart';

class LoginField extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? passwordController;

  const LoginField({
    super.key,
    this.nameController,
    this.passwordController
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height40),
        TextFieldWidget(
          labelText: 'Login',
          inputType: TextInputType.emailAddress,
          controller: nameController,
        ),
        SizedBox(height: height16),
        TextFieldWidget(
          labelText: 'Password',
          inputType: TextInputType.visiblePassword,
          controller: passwordController,
        ),
      ],
    );
  }
}