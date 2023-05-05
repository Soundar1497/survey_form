import 'package:flutter/material.dart';

class Constant {
  /*
  static String verySatisfied = "\u{1F601}";
  static String satisfied = "\u{1F60A}";
  static String neutral = "\u{1F641}";
  static String dissatisfied = "\u{1F61E}";
  static String veryDissatisfied = "\u{1F620}";

  static List radioButtonText = [
    "Very Satisfied",
    "Satisfied",
    "Neutral",
    "Dissatisfied",
    "Very Dissatisfied",
  ];

  static List emojiList = [
    verySatisfied,
    satisfied,
    neutral,
    dissatisfied,
    veryDissatisfied
  ];

   */

  static List feedBackData = [
    {
      "img": "assets/image_emoji/image_emoji_excellent.png",
      "text": "EXCELLENT"
    },
    {"img": "assets/image_emoji/image_emoji_good.png", "text": "GOOD"},
    {"img": "assets/image_emoji/image_emoji_average.png", "text": "AVERAGE"},
    {"img": "assets/image_emoji/image_emoji_poor.png", "text": "POOR"},
    {"img": "assets/image_emoji/image_emoji_very_poor.png", "text": "VERY POOR"}
  ];

  static List<String> questionText = [
    "How was your food today?",
    "How was your service today?"
  ];

  static String endDetail = "Powered By form.microspacesoft.com";

  static const onTapOrange = Color.fromRGBO(246, 170, 142, 0.5);

  static Color orange = Color(0xbff84109);
}
