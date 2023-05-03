import 'package:flutter/material.dart';
import 'package:survey_form/controller/login_control.dart';
import 'package:survey_form/ui/survey_screen/survey_screen.dart';

import '../widget/address_TextField.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  LogInControl _logInControl = LogInControl();
  var atime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

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
              body: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 500,
                    height: dh,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // name and logo
                            const SizedBox(
                              height: 40,
                            ),
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image(
                                  image:
                                      const AssetImage("assets/playstore.png"),
                                  width: w * .24,
                                  height: w * .24,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 8,
                              // ),
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
                                          fontSize: w * .1,
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
                                        fontSize: w * .04,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey[700]),
                                  )
                                ],
                              ),
                            ]),

                            //log in
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                // color: Colors.grey[700]
                              ),
                            ),

                            const SizedBox(
                              height: 30,
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

                            const SizedBox(
                              height: 20,
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
                            const SizedBox(
                              height: 80,
                            ),

                            SizedBox(
                              width: w,
                              height: 55,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SurveyScreen()),
                                        (route) => false);
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
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ))
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
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name and logo
                          const SizedBox(
                            height: 40,
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image(
                                image: const AssetImage("assets/playstore.png"),
                                width: dw * .25,
                                height: dw * .25,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 8,
                            // ),
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
                                        fontSize: dw * .09,
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
                                      fontSize: dw * .04,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey[700]),
                                )
                              ],
                            ),
                          ]),

                          //log in
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              // color: Colors.grey[700]
                            ),
                          ),

                          const SizedBox(
                            height: 30,
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

                          const SizedBox(
                            height: 20,
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
                          const SizedBox(
                            height: 80,
                          ),

                          SizedBox(
                            width: dw,
                            height: 55,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SurveyScreen()),
                                      (route) => false);
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
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
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
