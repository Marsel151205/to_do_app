
import 'package:flutter/material.dart';
import 'package:to_do_app/core/themes/text_styles.dart';

class HintTextWidget extends StatelessWidget {
  final String text;

  const HintTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: head3TextStyle,);
  }
}