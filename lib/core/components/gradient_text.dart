import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientText extends StatelessWidget {
  TextStyle? textStyle;
  String? text;
  GradientText({
    Key? key,
    this.textStyle,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Colors.green,
            Colors.orange,
            Colors.red,
          ],
        ).createShader(
          Rect.fromLTRB(
            bounds.left,
            bounds.top,
            bounds.right,
            bounds.bottom,
          ),
        );
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text!,
        style: textStyle,
      ),
    );
  }
}
