import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class DefaultElevatedButtonBlue extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final ButtonStyle style;

  const DefaultElevatedButtonBlue(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: SizedBox(
          width: 85.w,
          height: 5.5.h,
          child: Center(
            child: DefaultText(
              text: text,
              fontSize: 20,
            ),
          )),
    );
  }
}
