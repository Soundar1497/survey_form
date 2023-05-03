import 'package:flutter/material.dart';
import 'package:survey_form/ui/survey_screen/survey_radio_button.dart';

import '../../theme/custom_text_style.dart';

class SurveyContainer extends StatefulWidget {
  const SurveyContainer({Key? key}) : super(key: key);

  @override
  State<SurveyContainer> createState() => _SurveyContainerState();
}

class _SurveyContainerState extends State<SurveyContainer> {
  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return dw > 500
        ? Container(
            width: dw,
            height: dh - 100,
            margin:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please share your feedback to improve our service...",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: dw - dw * .65,
                      // color: Colors.red,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: dw * .08,
                                  child: Text(
                                    "Very Satisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .08,
                                  child: Text(
                                    "Satisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .07,
                                  child: Text(
                                    "Neutral",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .12,
                                  child: Text(
                                    "Dissatisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .12,
                                  child: Text(
                                    "very Dissatisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 4,
                            thickness: .5,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: const SurveyRatioButton()),
              ],
            ),
          )
        : Container(
            width: dw,
            height: dh - 100,
            margin:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please share your feedback to improve our service...",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: dw - dw * .65,
                      // color: Colors.red,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: dw * .08,
                                  child: Text(
                                    "Very Satisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .08,
                                  child: Text(
                                    "Satisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .07,
                                  child: Text(
                                    "Neutral",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .12,
                                  child: Text(
                                    "Dissatisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                              SizedBox(
                                  width: dw * .12,
                                  child: Text(
                                    "very Dissatisfied",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.radioTitle(context),
                                  )),
                            ],
                          ),
                          const Divider(
                            height: 4,
                            thickness: .5,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SurveyRatioButton()),
              ],
            ),
          );
  }
}
