import 'package:flutter/material.dart';

class CustomTextStyle {
  // grid view one
  static TextStyle? radioTitle(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * 0.02,
        );
  }

  static TextStyle? radioHeading(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * 0.02,
        );
  }

  static TextStyle? radioHeading2(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * 0.026,
        );
  }
}
