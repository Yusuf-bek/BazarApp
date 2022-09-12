import 'package:flutter/material.dart';

abstract class MyTextStyles {}

class LoginPageStyles extends MyTextStyles {
  LoginPageStyles._init();
  static final LoginPageStyles _instance = LoginPageStyles._init();
  static LoginPageStyles get instance => _instance;

  TextStyle pageHeadlineStyle = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  TextStyle myHintTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

class MainPageStyles extends MyTextStyles {
  MainPageStyles._init();
  static final MainPageStyles _instance = MainPageStyles._init();
  static MainPageStyles get instance => _instance;

  TextStyle appNameStyle = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  TextStyle categoryTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
}

class ReportPageStyles extends MyTextStyles {
  ReportPageStyles._init();
  static final ReportPageStyles _instance = ReportPageStyles._init();
  static ReportPageStyles get instance => _instance;

  TextStyle hisobotTurlariStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
