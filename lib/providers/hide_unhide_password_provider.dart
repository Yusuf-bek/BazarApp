import 'package:flutter/material.dart';

/// For hide/unhide [obsecurity] of password in login-page
class HidePasswordProvider extends ChangeNotifier {
  /// [_isVisible] is private variable
  bool _isVisible = false;

  /// [isVisible] is for private [_isVisible] variable
  bool get isVisible => _isVisible;

  /// changes value of [bool][_isVisible] to it's opposite value
  ///
  /// then it will notify listeners of HidePasswordProvider
  void changeVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
