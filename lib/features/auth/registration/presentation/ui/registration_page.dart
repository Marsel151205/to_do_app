import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/text_styles.dart';
import 'package:to_do_app/core/widgets/hint_text_widget.dart';
import 'package:to_do_app/core/widgets/primary_button.dart';
import 'package:to_do_app/core/widgets/text_field_widget.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/dimens.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topMargin = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padding24,
            ).copyWith(top: (topMargin + padding24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up', style: head2TextStyle),
                SizedBox(height: height8),
                Text('Create an account to get started ', style: body1TextStyle),
                SizedBox(height: height24),
                HintTextWidget(text: 'Name'),
                SizedBox(height: height8),
                TextFieldWidget(
                  labelText: 'Lucas',
                  inputType: TextInputType.name,
                ),
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
                SizedBox(height: height40),
                PrimaryButton(onTap: () {}, labelText: 'Register'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
