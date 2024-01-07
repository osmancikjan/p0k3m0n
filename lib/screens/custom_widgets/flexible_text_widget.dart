import 'package:flutter/material.dart';

final class FlexibleText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const FlexibleText(this.text,
      {super.key, this.textStyle, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: textStyle,
        textAlign: textAlign,
      ),
    );
  }
}
