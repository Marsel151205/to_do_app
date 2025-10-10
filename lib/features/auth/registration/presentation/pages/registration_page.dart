import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/primary_button.dart';

import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/dimens.dart';
import '../widgets/register_fields.dart';
import '../widgets/register_header.dart';

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
                RegisterHeader(),
                RegisterFields(),
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
