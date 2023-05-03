import 'package:flutter/material.dart';
import 'package:survey_form/ui/survey_screen/survey_container.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  var atime;

  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    double w = 500;

    print("width : $dw , heigth : $dh");

    return dw > 500
        ? WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (atime == null ||
                  now.difference(atime) > const Duration(seconds: 1)) {
                //add duration of press gap
                atime = now;
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
                title: Container(
                  alignment: Alignment.topRight,
                  height: 40,
                  margin: EdgeInsets.only(top: 20),
                  // color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "Customer Satisfaction Survey",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 265,
                        // height: 3,
                        // color: Colors.red,
                        child: Divider(
                          height: 2,
                          color: Colors.red,
                          thickness: 5,
                        ),
                      )
                    ],
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/playstore.png"),
                ),
                // actions: [
                //   Container(
                //     height: 10,
                //     color: Colors.yellow,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Customer Satisfaction Survey",
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         Container(
                //           height: 3,
                //           color: Colors.red,
                //           child: const Divider(
                //             height: 2,
                //             color: Colors.red,
                //             thickness: 5,
                //           ),
                //         )
                //       ],
                //     ),
                //   )
                // ],
              ),
              body: Column(
                children: const [
                  Expanded(child: SurveyContainer()),
                ],
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () {
              DateTime now = DateTime.now();
              if (atime == null ||
                  now.difference(atime) > const Duration(seconds: 1)) {
                //add duration of press gap
                atime = now;
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
                title: Container(
                  alignment: Alignment.topRight,
                  height: 40,
                  margin: EdgeInsets.only(top: 20),
                  // color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "Customer Satisfaction Survey",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 265,
                        // height: 3,
                        // color: Colors.red,
                        child: Divider(
                          height: 2,
                          color: Colors.red,
                          thickness: 5,
                        ),
                      )
                    ],
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/playstore.png"),
                ),
                // actions: [
                //   Container(
                //     height: 10,
                //     color: Colors.yellow,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Customer Satisfaction Survey",
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         Container(
                //           height: 3,
                //           color: Colors.red,
                //           child: const Divider(
                //             height: 2,
                //             color: Colors.red,
                //             thickness: 5,
                //           ),
                //         )
                //       ],
                //     ),
                //   )
                // ],
              ),
              body: Column(
                children: const [
                  Expanded(child: SurveyContainer()),
                ],
              ),
            ),
          );
  }
}
