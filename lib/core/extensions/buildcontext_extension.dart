import 'package:flutter/material.dart';

/// For getting screen width/height with short-code
///

extension GetScreenSizeExtention on BuildContext {
  ///
  /// Word [this] takes [context] to it's place
  ///
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  ///
  /// two getters are for getting full screen height and width
}
