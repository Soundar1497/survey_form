import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class VotingCard extends StatefulWidget {
  VotingCard({Key? key, required this.emojiText, required this.radioText})
      : super(key: key);

  String emojiText;
  String radioText;

  @override
  State<VotingCard> createState() => _VotingCardState();
}

class _VotingCardState extends State<VotingCard> {
  var buttonValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(.5, .5),
              blurRadius: 1,
              spreadRadius: 1.5)
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(widget.emojiText),
          Row(
            children: [
              Radio(
                  value: "1",
                  groupValue: buttonValue,
                  onChanged: (val) {
                    buttonValue = "1";
                  }),
              Text(Constant.radioButtonText[1])
            ],
          )
        ],
      ),
    );
  }
}
