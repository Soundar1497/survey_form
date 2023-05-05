import 'package:flutter/material.dart';
import 'package:survey_form/controller/login_control.dart';

import '../constant/constant.dart';
import '../theme/custom_text_style.dart';
import '../widget/address_TextField.dart';
import 'feedback_page/feedback_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  LogInControl _logInControl = LogInControl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    final safePadding = MediaQuery.of(context).padding.top;
    print("width : $dw , heigth : $dh ,  safe Area Padding : $safePadding");

    print("Device orientation : ${MediaQuery.of(context).orientation}");

    return MediaQuery.of(context).orientation == Orientation.portrait
        // orientation for Portrait
        ? WillPopScope(
            onWillPop: () {
              var popTimeCount;

              DateTime now = DateTime.now();
              if (popTimeCount == null ||
                  now.difference(popTimeCount) > const Duration(seconds: 1)) {
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
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Stack(children: [
                  Center(
                    child: Container(
                      width: dw,
                      height: dh,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: dw * .05),
                        child: Form(
                          key: _logInControl.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name and logo
                              SizedBox(
                                height: dh * .05,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Container(
                                    //   width: 100,
                                    //   height: 100,
                                    //   decoration: const BoxDecoration(
                                    //       image: DecorationImage(
                                    //           image: AssetImage(
                                    //               "assets/food_now_os.png"),
                                    //           fit: BoxFit.fitWidth)),
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                  style: TextStyle(
                                                      color: Colors.grey[700])),
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
                                  ]),

                              //log in
                              SizedBox(
                                height: dh * .08,
                              ),
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: dh * 0.03,
                                  fontWeight: FontWeight.w800,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              SizedBox(
                                height: dh * .04,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: dh * 0.02,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              AddressTextField(
                                // icon: const Icon(
                                //   Icons.search_rounded,
                                //   size: 24,
                                // ),
                                obscureText: false,
                                controller: _logInControl.email,
                                hintText: 'Enter Email',
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "* please provide necessary details";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                height: dh * .06,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: dh * 0.02,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              AddressTextField(
                                obscureText: true,
                                controller: _logInControl.password,
                                hintText: 'Enter Password',
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "* please provide necessary details";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: dh * .06,
                              ),

                              Container(
                                width: dw,
                                // height: dh * .055,

                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FeedBackPage()),
                                          (route) => false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              content:
                                                  Text("Login Successfully")));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xfffc571b)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: dh * .035,
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: dh * .005,
                              ),
                            ],
                          ),
                        ),
                      ),
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
            ))
        // orientation for Landscape
        : WillPopScope(
            onWillPop: () {
              var popTimeCount;

              DateTime now = DateTime.now();
              if (popTimeCount == null ||
                  now.difference(popTimeCount) > const Duration(seconds: 1)) {
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
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Stack(children: [
                  Center(
                    child: Container(
                      width: dw,
                      height: dh - safePadding / 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: dw * .1, right: dw * .1),
                        child: Form(
                          key: _logInControl.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name and logo
                              SizedBox(
                                height: dh * .02,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Container(
                                    //   width: 100,
                                    //   height: 100,
                                    //   decoration: const BoxDecoration(
                                    //       image: DecorationImage(
                                    //           image: AssetImage(
                                    //               "assets/food_now_os.png"),
                                    //           fit: BoxFit.fitWidth)),
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                  style: TextStyle(
                                                      color: Colors.grey[700])),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Ordering System Mad Easy',
                                          style: TextStyle(
                                              fontSize: dw * .01,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ]),

                              //log in
                              SizedBox(
                                height: dh * .02,
                              ),
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: dh * 0.07,
                                  fontWeight: FontWeight.w800,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              SizedBox(
                                height: dh * .04,
                              ),
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              AddressTextField(
                                // icon: const Icon(
                                //   Icons.search_rounded,
                                //   size: 24,
                                // ),
                                obscureText: false,
                                controller: _logInControl.email,
                                hintText: 'Enter Email',
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "* please provide necessary details";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(
                                height: dh * .04,
                              ),
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.grey[700]
                                ),
                              ),

                              AddressTextField(
                                obscureText: true,
                                controller: _logInControl.password,
                                hintText: 'Enter Password',
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "* please provide necessary details";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: dh * .04,
                              ),

                              SizedBox(
                                width: dw,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FeedBackPage()),
                                          (route) => false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 1500),
                                              content:
                                                  Text("Login Successfully")));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xfffc571b)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        )),
                                    child: const Text(
                                      ''
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: dh * .05,
                              ),
                            ],
                          ),
                        ),
                      ),
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
            ));
  }
}
