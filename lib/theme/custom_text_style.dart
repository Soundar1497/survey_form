import 'package:flutter/material.dart';

class CustomTextStyle {
  // portrait

  static TextStyle? questionHeading(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?
        // orientation for Portrait

        Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: dw * .04,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600])
        :
        // orientation for Landscape

        Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: dw * .03,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600]);
  }

//  button text

  static TextStyle? feedBackButton(BuildContext context, i, onTapData) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?
        // orientation for Portrait
        Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: onTapData == i ? dw * .028 : dw * .025,
            fontWeight: onTapData == i ? FontWeight.w900 : FontWeight.w600,
            color: onTapData == i ? Colors.white : Colors.grey)
        :
        // orientation for Landscape

        Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: onTapData == i ? dw * .02 : dw * .017,
            fontWeight: onTapData == i ? FontWeight.w900 : FontWeight.w600,
            color: onTapData == i ? Colors.white : Colors.grey);
  }

//  footer text

  static TextStyle? footerText(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?
        // orientation for Portrait
        Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: dh * .02,
            fontWeight: FontWeight.w400,
            color: Colors.grey[400])
        :
        // orientation for Landscape

        Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: dh * .028,
            fontWeight: FontWeight.w400,
            color: Colors.grey[400]);
  }

  static TextStyle? votingIcon(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * .1,
        );
  }

  // mobile

  static TextStyle? questionHeading(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * .06,
        );
  }

  //taplet
  static TextStyle? questionHeading2(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * .03,
        );
  }
  // mobile

  static TextStyle? questionButton(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * .033,
        );
  }

//taplet
  static TextStyle? questionButton2(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: dw * .02,
        );
  }
}
