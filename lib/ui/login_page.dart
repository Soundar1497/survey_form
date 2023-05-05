import 'package:flutter/material.dart';
import 'package:survey_form/controller/login_control.dart';
import 'package:survey_form/ui/query_list_page/query_list_page.dart';

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

  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    double w = 500;

    print("width : $dw , heigth : $dh");

    return WillPopScope(
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
                width: dw,
                height: dh,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
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
                        SizedBox(
                          height: dh * .07,
                        ),
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            // color: Colors.grey[700]
                          ),
                        ),

                        SizedBox(
                          height: dh * .007,
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
                          height: dh * .05,
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
                          height: dh * .07,
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
                                            const QueryListPage()),
                                    (route) => false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        content: Text("Login Successfully")));
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xfffc571b)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                          height: dh * .005,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
