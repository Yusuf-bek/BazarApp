import 'package:flutter/material.dart';

class SizeConfig {
  late BuildContext context;
  static late double screenWidth;
  static late double screenHeight;

  SizeConfig.init(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}

getConfigWidth(double width) {
  return 414 / SizeConfig.screenWidth * width;
}

getConfigHeight(double height) {
  return 896 / SizeConfig.screenHeight * height;
}
