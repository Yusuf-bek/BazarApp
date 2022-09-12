import 'package:flutter/material.dart';

/// Generates gradient-text-widget
///
/// wraps given text with [ShaderMask] and
/// makes it colorful with [green,orange,red]
class GradientText extends StatelessWidget {
  /// Style for given gradient-text
  final TextStyle? textStyle;

  /// Text for gradient-text
  final String? text;

  const GradientText({
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
