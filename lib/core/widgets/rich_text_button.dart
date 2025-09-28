import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  final List<TextSpan> textSpans;
  final Function() onTap;

  const RichTextButton({
    super.key,
    required this.textSpans,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(text: TextSpan(children: textSpans)),
    );
  }
}
