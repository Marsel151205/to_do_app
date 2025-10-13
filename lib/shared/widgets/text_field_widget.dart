import 'package:flutter/material.dart';
import 'package:to_do_app/shared/themes/colors.dart';

import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final ValueChanged<String>? onTyped;

  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.inputType,
    this.onTyped
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTyped,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: body2TextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: BorderSide(width: width1, color: lightGray),
        ),
      ),
    );
  }
}
