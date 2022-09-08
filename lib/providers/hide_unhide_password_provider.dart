import 'package:flutter/material.dart';

class HidePasswordProvider extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void changeVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
