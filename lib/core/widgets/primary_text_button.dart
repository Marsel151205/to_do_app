import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  final Function() onTap;
  final String labelText;

  const PrimaryTextButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(labelText, style: action1TextStyle),
    );
  }
}
