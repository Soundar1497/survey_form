class Constant {
  static String verySatisfied = "\u{1F601}";
  static String satisfied = "\u{1F60A}";
  static String neutral = "\u{1F641}";
  static String dissatisfied = "\u{1F61E}";
  static String veryDissatisfied = "\u{1F620}";
  // \u{1F610}
  // \u{1F613}
  // \u{1F621}

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
}

enum FeedBacButton {
  verySatisfied,
  satisfied,
  neutral,
  dissatisfied,
  veryDissatisfied
}
