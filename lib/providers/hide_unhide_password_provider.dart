import 'package:flutter/material.dart';

/// For hide/unhide [obsecurity] of password in login-page
class HidePasswordProvider extends ChangeNotifier {
  bool isVisible = false;

  /// changes value of [bool][isVisible] to it's opposite value
  /// then it will notify listeners of HidePasswordProvider
  void changeVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
