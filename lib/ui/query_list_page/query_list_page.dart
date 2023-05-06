import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_form/theme/color_pattern.dart';
import 'package:survey_form/theme/custom_text_style.dart';
import 'package:survey_form/ui/login_page.dart';
import 'package:survey_form/ui/query_list_page/feedback_button.dart';

import '../../provider/feed_back_value.dart';

class QueryListPage extends StatefulWidget {
  const QueryListPage({Key? key}) : super(key: key);

  @override
  State<QueryListPage> createState() => _QueryListPageState();
}

class _QueryListPageState extends State<QueryListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FeedBackValue>(context);

    //
    var popExitCount;

    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;

    var pixRatio = MediaQuery.of(context).devicePixelRatio;

    print("width : ${dw * pixRatio} , heigth : ${dh * pixRatio}");
    print("width : ${dw} , heigth : ${dh}");

    return dw < 500
        ? WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (popExitCount == null ||
                  now.difference(popExitCount) > const Duration(seconds: 1)) {
                //add duration of press gap
                popExitCount = now;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                        'Press Again to Exit'))); //scaffold message, you can show Toast message too.
                return Future.value(false);
              }

              return Future.value(true);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "Customer Satisfaction Survey",
                  style: TextStyle(color: Colors.black),
                ),
                /*
          Container(
            alignment: Alignment.topLeft,
            height: 38,
            margin: const EdgeInsets.only(top: 20),
            // color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "Customer Satisfaction Survey",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 270,
                  // height: 3,
                  // color: Colors.red,
                  child: Divider(
                    height: 5,
                    color: Color(0xfffc571b),
                    thickness: 4,
                  ),
                )
              ],
            ),
          ),
          */

                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInPage()),
                            (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 1500),
                                content: Text("Logout Successfully")));
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 30,
                        color: Color(0xfffc571b),
                      )),
                ],
                // leading: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image.asset("assets/playstore.png"),
                // ),
              ),
              body: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      GradientColor.splashColor1,
                      GradientColor.splashColor2,
                      GradientColor.splashColor3,
                      GradientColor.splashColor4,
                      GradientColor.splashColor5,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: dw * .025,
                    right: dw * .025,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: dw,
                        padding: EdgeInsets.only(top: dh * 0.05),
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
                                  fontSize: dw * .03,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: dh * .09,
                        ),
                        child: Text(
                          "How satisfied were you with the food?",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.questionHeading(context),
                        ),
                      ),
                      FeedBackButton(button: "foodButton"),

                      //question 2
                      Padding(
                        padding: EdgeInsets.only(
                          top: dh * .05,
                        ),
                        child: Text(
                          "How satisfied were you with the service?",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.questionHeading(context),
                        ),
                      ),
                      FeedBackButton(button: "serviceButton"),
                    ],
                  ),
                ),
              ]),
            ),
          )
        : WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (popExitCount == null ||
                  now.difference(popExitCount) > const Duration(seconds: 1)) {
                //add duration of press gap
                popExitCount = now;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                        'Press Again to Exit'))); //scaffold message, you can show Toast message too.
                return Future.value(false);
              }

              return Future.value(true);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "Customer Satisfaction Survey",
                  style: TextStyle(color: Colors.black),
                ),
                /*
          Container(
            alignment: Alignment.topLeft,
            height: 38,
            margin: const EdgeInsets.only(top: 20),
            // color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Text(
                    "Customer Satisfaction Survey",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 270,
                  // height: 3,
                  // color: Colors.red,
                  child: Divider(
                    height: 5,
                    color: Color(0xfffc571b),
                    thickness: 4,
                  ),
                )
              ],
            ),
          ),
          */

                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInPage()),
                            (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 1500),
                                content: Text("Logout Successfully")));
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 30,
                        color: Color(0xfffc571b),
                      )),
                ],
                // leading: Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Image.asset("assets/playstore.png"),
                // ),
              ),
              body: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      GradientColor.splashColor1,
                      GradientColor.splashColor2,
                      GradientColor.splashColor3,
                      GradientColor.splashColor4,
                      GradientColor.splashColor5,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: dw * .04,
                    right: dw * .04,
                  ),
                  child: Column(
                    children: [
                      // logo text
                      Container(
                        width: dw,
                        padding: EdgeInsets.only(top: dh * 0.02),
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
                                    fontSize: dw * .04,
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
                                  fontSize: dw * .015,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: dh * .06,
                        ),
                        child: Text(
                          "How satisfied were you with the food?",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.questionHeading2(context),
                        ),
                      ),
                      FeedBackButton(button: "foodButton"),

                      //question 2
                      Padding(
                        padding: EdgeInsets.only(
                          top: dh * .06,
                        ),
                        child: Text(
                          "How satisfied were you with the service?",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.questionHeading2(context),
                        ),
                      ),
                      FeedBackButton(button: "serviceButton"),
                    ],
                  ),
                ),
              ]),
            ),
          );
  }
}
