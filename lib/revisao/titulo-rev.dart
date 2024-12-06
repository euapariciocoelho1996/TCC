import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String info;
  final String title;
  TextStyle? firstTextStyle;
  TextStyle? secondTextStyle;

  CustomRichText(
      {super.key,
      required this.info,
      required this.title,
      this.firstTextStyle,
      this.secondTextStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: info,
            style: firstTextStyle ??
                const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
            children: [
          TextSpan(
            text: ' $title',
            style: secondTextStyle ??
                const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.amber),
          )
        ]));
  }
}
