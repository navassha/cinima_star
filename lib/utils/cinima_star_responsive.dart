import 'package:flutter/material.dart';

class ResMobSize {
  static double height(double height, BuildContext context) {
    return MediaQuery.of(context).size.height * (height / 893);
  }

  static double width(double width, BuildContext context) {
    return MediaQuery.of(context).size.width * (width / 375);
  }
}
