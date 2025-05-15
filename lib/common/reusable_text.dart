import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextOverflow? overflow;

  const ReusableText({
    Key? key,
    required this.text,
    required this.style,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: overflow, // <- optional truncation
      maxLines: 1, // <- limit to one line
    );
  }
}
