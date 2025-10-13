import 'package:flutter/material.dart';
import 'package:to_do_app/shared/themes/colors.dart';
import 'package:to_do_app/shared/themes/dimens.dart';
import 'package:to_do_app/shared/themes/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final String labelText;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          elevation: elevation0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius12),
          ),
          padding: EdgeInsets.symmetric(vertical: padding16),
        ),
        child: Text(labelText, style: action2TextStyle),
      ),
    );
  }
}
