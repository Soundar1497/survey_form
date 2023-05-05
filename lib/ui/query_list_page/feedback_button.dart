import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_form/theme/custom_text_style.dart';

import '../../constant/constant.dart';
import '../../provider/feed_back_value.dart';

class FeedBackButton extends StatefulWidget {
  FeedBackButton({Key? key, required this.button}) : super(key: key);

  String button;

  @override
  State<FeedBackButton> createState() => _FeedBackButtonState();
}

class _FeedBackButtonState extends State<FeedBackButton> {
  String? feedback;
  FeedBackValue _feedBackValue = FeedBackValue();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _feedBackValue.serviceButton = "";
      _feedBackValue.foodButton = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FeedBackValue>(context, listen: true);
    // print(
    //     "serviceButton: $provider.serviceButton , foodButton: $provider.foodButton");

    void assignData(String data) {
      if (widget.button == "foodButton") {
        setState(() {
          provider.foodButton = data;
        });
      } else {
        setState(() {
          provider.serviceButton = data;
        });
      }
    }

    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    var pixRatio = MediaQuery.of(context).devicePixelRatio;

    var tapIconSize = dw * .06;
    var containerWidth = dw * 0.13;
    var containerHeight = dh * 0.2;
    BorderRadius _borderRadius = BorderRadius.only(
      topRight: Radius.circular(dw * .02),
      bottomLeft: Radius.circular(dw * .02),
      topLeft: Radius.circular(dw * .06),
      bottomRight: Radius.circular(dw * .06),
    );

    return dw < 500
        ? Padding(
            padding: EdgeInsets.only(top: dh * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: dh * 0.125,
                  width: dw * .18,
                  decoration: BoxDecoration(
                    color: feedback == "excellent"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(dw * .03),
                      bottomLeft: Radius.circular(dw * .03),
                      topLeft: Radius.circular(dw * .09),
                      bottomRight: Radius.circular(dw * .09),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      ),
                      onTap: () {
                        setState(() {
                          feedback = "excellent";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[0],
                                style: TextStyle(fontSize: dw * .1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Excellent",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: dh * 0.13,
                  width: dw * .18,
                  decoration: BoxDecoration(
                      color: feedback == "good"
                          ? Colors.green[200]
                          : Colors.red[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      )),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      ),
                      onTap: () {
                        setState(() {
                          feedback = "good";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[1],
                                style: TextStyle(fontSize: dw * .1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Good",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: dh * 0.13,
                  width: dw * .18,
                  decoration: BoxDecoration(
                    color: feedback == "neutral"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(dw * .03),
                      bottomLeft: Radius.circular(dw * .03),
                      topLeft: Radius.circular(dw * .09),
                      bottomRight: Radius.circular(dw * .09),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      ),
                      onTap: () {
                        setState(() {
                          feedback = "neutral";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[2],
                                style: TextStyle(fontSize: dw * .1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Neutral",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: dh * 0.13,
                  width: dw * .18,
                  decoration: BoxDecoration(
                    color:
                        feedback == "bad" ? Colors.green[200] : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(dw * .03),
                      bottomLeft: Radius.circular(dw * .03),
                      topLeft: Radius.circular(dw * .09),
                      bottomRight: Radius.circular(dw * .09),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      ),
                      onTap: () {
                        setState(() {
                          feedback = "bad";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[3],
                                style: TextStyle(fontSize: dw * .1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Bad",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: dh * 0.13,
                  width: dw * .18,
                  decoration: BoxDecoration(
                    color: feedback == "terrible"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(dw * .03),
                      bottomLeft: Radius.circular(dw * .03),
                      topLeft: Radius.circular(dw * .09),
                      bottomRight: Radius.circular(dw * .09),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(dw * .03),
                        bottomLeft: Radius.circular(dw * .03),
                        topLeft: Radius.circular(dw * .09),
                        bottomRight: Radius.circular(dw * .09),
                      ),
                      onTap: () {
                        setState(() {
                          feedback = "terrible";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[4],
                                style: TextStyle(fontSize: dw * .1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Terrible",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: dh * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: feedback == "excellent"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: _borderRadius,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: _borderRadius,
                      onTap: () {
                        setState(() {
                          feedback = "excellent";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[0],
                                style: TextStyle(fontSize: tapIconSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Excellent",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton2(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: feedback == "good"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: _borderRadius,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: _borderRadius,
                      onTap: () {
                        setState(() {
                          feedback = "good";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[1],
                                style: TextStyle(fontSize: tapIconSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Good",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton2(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: feedback == "neutral"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: _borderRadius,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: _borderRadius,
                      onTap: () {
                        setState(() {
                          feedback = "neutral";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[2],
                                style: TextStyle(fontSize: tapIconSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Neutral",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton2(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color:
                        feedback == "bad" ? Colors.green[200] : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: _borderRadius,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: _borderRadius,
                      onTap: () {
                        setState(() {
                          feedback = "bad";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[3],
                                style: TextStyle(fontSize: tapIconSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Bad",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton2(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    color: feedback == "terrible"
                        ? Colors.green[200]
                        : Colors.red[100],
                    shape: BoxShape.rectangle,
                    borderRadius: _borderRadius,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: _borderRadius,
                      onTap: () {
                        setState(() {
                          feedback = "terrible";
                          assignData(feedback!);
                          provider.successFeedBack(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: dh * .01),
                              child: Text(
                                Constant.emojiList[4],
                                style: TextStyle(fontSize: tapIconSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: dh * .013,
                                  right: dw * .02,
                                  left: dw * 0.02),
                              child: Text(
                                "Terrible",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.questionButton2(context),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
