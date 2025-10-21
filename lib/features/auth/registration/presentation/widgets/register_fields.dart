
import 'package:flutter/material.dart';

import '../../../../../shared/themes/dimens.dart';
import '../../../../../shared/widgets/hint_text_widget.dart';
import '../../../../../shared/widgets/text_field_widget.dart';

class RegisterFields extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;

  const RegisterFields({
    super.key,
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height24),
        HintTextWidget(text: 'Name'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'Lucas',
          inputType: TextInputType.name,
          controller: nameController,
        ),
        SizedBox(height: height16),
        HintTextWidget(text: 'Email Address'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'example@email.com',
          inputType: TextInputType.emailAddress,
          controller: emailController,
        ),
        SizedBox(height: height16),
        HintTextWidget(text: 'Password'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'Create a Password',
          inputType: TextInputType.visiblePassword,
          controller: passwordController,
        ),
        SizedBox(height: height16),
        TextFieldWidget(
          labelText: 'Confirm Password',
          inputType: TextInputType.visiblePassword,
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}
