import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../provider/feed_back_value.dart';
import '../../theme/custom_text_style.dart';
import 'feedback_page.dart';

class TapCard extends StatefulWidget {
  TapCard({Key? key, required this.dataFor}) : super(key: key);
  ButtonData dataFor;
  @override
  State<TapCard> createState() => _TapCardState();
}

class _TapCardState extends State<TapCard> {
  FeedBackValue _feedBackValue = FeedBackValue();
  var _onTap;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FeedBackValue>(context, listen: true);

    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    print("width : $dw , heigth : $dh ,  safe Area Padding : $safePadding");

    print("Device orientation : ${MediaQuery.of(context).orientation}");

    print("_onTap: ${_onTap}");
    print(widget.dataFor);
    print("Provider data : ${provider.serviceButton}, ${provider.foodButton}");

    return MediaQuery.of(context).orientation == Orientation.portrait

        // orientation for Portrait

        ? Container(
            height: dw * .23,
            width: dw,
            // color: Colors.yellow,
            margin: EdgeInsets.only(top: dh * .02),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 1.28),
              itemCount: Constant.feedBackData.length,
              itemBuilder: (context, i) {
                return Stack(children: [
                  Container(
                    // width: dw,
                    // height: dh * .02,
                    decoration: BoxDecoration(
                      color: (_onTap == i ? Constant.orange : null),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // width: 55,
                          height: dh * .1,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      Constant.feedBackData[i]["img"]))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Constant.feedBackData[i]["text"],
                            style: CustomTextStyle.feedBackButton(
                                context, i, _onTap),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // width: dw,
                    // height: dh * .02,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _onTap = i;
                            if (widget.dataFor == ButtonData.food) {
                              provider.foodButton = "$i";
                            }
                            if (widget.dataFor == ButtonData.service) {
                              provider.serviceButton = "$i";
                            }
                            print(i);
                            provider.successFeedBack(context);
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                ]);
              },
            ),
          )

        // orientation for Landscape

        : Container(
            height: dw * .15,
            width: dw,
            // color: Colors.yellow,
            margin: EdgeInsets.only(top: dh * .02),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 0.8),
              itemCount: Constant.feedBackData.length,
              itemBuilder: (context, i) {
                return Stack(children: [
                  Container(
                    // width: dw,
                    // height: dh * .02,
                    decoration: BoxDecoration(
                      color: (_onTap == i ? Constant.orange : null),
                      // color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: dw * .2,
                          height: dw * .1,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      Constant.feedBackData[i]["img"]))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Constant.feedBackData[i]["text"],
                            style: CustomTextStyle.feedBackButton(
                                context, i, _onTap),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // width: dw,
                    // height: dh * .02,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _onTap = i;
                            if (widget.dataFor == ButtonData.food) {
                              provider.foodButton = "$i";
                            }
                            if (widget.dataFor == ButtonData.service) {
                              provider.serviceButton = "$i";
                            }
                            print(i);
                            provider.successFeedBack(context);
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                ]);
              },
            ),
          );
  }
}
