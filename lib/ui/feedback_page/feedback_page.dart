import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_form/ui/feedback_page/tap_card.dart';

import '../../constant/constant.dart';
import '../../provider/feed_back_value.dart';
import '../../theme/custom_text_style.dart';
import '../login_page.dart';

enum ButtonData { food, service }

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FeedBackValue>(context, listen: true);

    //
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    print("width : $dw , heigth : $dh ,  safe Area Padding : $safePadding");

    print("Device orientation : ${MediaQuery.of(context).orientation}");

    print("Provider data : ${provider.serviceButton}, ${provider.foodButton}");

    return MediaQuery.of(context).orientation == Orientation.portrait
        // orientation for Portrait

        ? Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Customer Satisfaction Survey",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 1500),
                          content: Text("Logout Successfully")));
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: Color(0xfffc571b),
                    )),
              ],
            ),
            body: SafeArea(
              child: WillPopScope(
                onWillPop: () {
                  var popTimeCount;
                  DateTime now = DateTime.now();
                  if (popTimeCount == null ||
                      now.difference(popTimeCount) >
                          const Duration(seconds: 1)) {
                    //add duration of press gap
                    popTimeCount = now;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                            'Press Again to Exit'))); //scaffold message, you can show Toast message too.
                    return Future.value(false);
                  }

                  return Future.value(true);
                },
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dw * .05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: dw * .066),
                          width: dw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                softWrap: true,
                                text: TextSpan(
                                  text: 'FOODNOW',
                                  style: TextStyle(
                                      fontSize: dw * .07,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xfffc571b)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'OS',
                                        style:
                                            TextStyle(color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                              Text(
                                'Ordering System Mad Easy',
                                style: TextStyle(
                                    fontSize: dw * .024,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[700]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.06),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              "we appreciate your feedback",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.purple, fontSize: dw * .04),
                            ),
                          ),
                        ),
/*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "we appreciate your feedback",
                              style: TextStyle(color: Colors.purple),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
                                  softWrap: true,
                                  text: TextSpan(
                                    text: 'FOODNOW',
                                    style: TextStyle(
                                        fontSize: dw * .07,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xfffc571b)),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'OS',
                                          style:
                                              TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Ordering System Mad Easy',
                                  style: TextStyle(
                                      fontSize: dw * .024,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                          ],
                        ),

 */
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.1),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              Constant.questionText[0],
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.questionHeading(context),
                            ),
                          ),
                        ),
                        TapCard(dataFor: ButtonData.food),
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.06),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              Constant.questionText[1],
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.questionHeading(context),
                            ),
                          ),
                        ),
                        TapCard(dataFor: ButtonData.service),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: dh * .02,
                    child: SizedBox(
                      width: dw,
                      child: Text(
                        Constant.endDetail,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.footerText(context),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          )
        // orientation for Landscape

        : Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "Customer Satisfaction Survey",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 1500),
                          content: Text("Logout Successfully")));
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 30,
                      color: Color(0xfffc571b),
                    )),
              ],
            ),
            body: SafeArea(
              child: WillPopScope(
                onWillPop: () {
                  var popTimeCount;
                  DateTime now = DateTime.now();
                  if (popTimeCount == null ||
                      now.difference(popTimeCount) >
                          const Duration(seconds: 1)) {
                    //add duration of press gap
                    popTimeCount = now;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                            'Press Again to Exit'))); //scaffold message, you can show Toast message too.
                    return Future.value(false);
                  }

                  return Future.value(true);
                },
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dw * .03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: dw * .015),
                          width: dw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                softWrap: true,
                                text: TextSpan(
                                  text: 'FOODNOW',
                                  style: TextStyle(
                                      fontSize: dw * .03,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xfffc571b)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'OS',
                                        style:
                                            TextStyle(color: Colors.grey[700])),
                                  ],
                                ),
                              ),
                              Text(
                                'Ordering System Mad Easy',
                                style: TextStyle(
                                    fontSize: dw * .011,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey[700]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.015),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              "we appreciate your feedback",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.purple, fontSize: dw * .03),
                            ),
                          ),
                        ),
/*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "we appreciate your feedback",
                              style: TextStyle(color: Colors.purple),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
                                  softWrap: true,
                                  text: TextSpan(
                                    text: 'FOODNOW',
                                    style: TextStyle(
                                        fontSize: dw * .07,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xfffc571b)),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'OS',
                                          style:
                                              TextStyle(color: Colors.grey[700])),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Ordering System Mad Easy',
                                  style: TextStyle(
                                      fontSize: dw * .024,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                          ],
                        ),

 */
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.05),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              Constant.questionText[0],
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.questionHeading(context),
                            ),
                          ),
                        ),
                        TapCard(dataFor: ButtonData.food),
                        Padding(
                          padding: EdgeInsets.only(top: dw * 0.03),
                          child: SizedBox(
                            width: dw,
                            child: Text(
                              Constant.questionText[1],
                              textAlign: TextAlign.center,
                              style: CustomTextStyle.questionHeading(context),
                            ),
                          ),
                        ),
                        TapCard(dataFor: ButtonData.service),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: dh * .01,
                    child: SizedBox(
                      width: dw,
                      child: Text(
                        Constant.endDetail,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.footerText(context),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
  }
}
