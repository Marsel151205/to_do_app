import 'package:flutter/cupertino.dart';

import '../../../../../core/themes/dimens.dart';
import '../../../../../core/widgets/hint_text_widget.dart';
import '../../../../../core/widgets/text_field_widget.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height24),
        HintTextWidget(text: 'Name'),
        SizedBox(height: height8),
        TextFieldWidget(labelText: 'Lucas', inputType: TextInputType.name),
        SizedBox(height: height16),
        HintTextWidget(text: 'Email Address'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'example@email.com',
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: height16),
        HintTextWidget(text: 'Password'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'Create a Password',
          inputType: TextInputType.visiblePassword,
        ),
        SizedBox(height: height16),
        TextFieldWidget(
          labelText: 'Confirm Password',
          inputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
