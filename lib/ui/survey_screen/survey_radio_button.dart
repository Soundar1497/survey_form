import 'package:flutter/material.dart';
import 'package:survey_form/ui/login_page.dart';

import '../../theme/custom_text_style.dart';

enum FeedBackButton {
  verySatisfied,
  satisfied,
  neutral,
  dissatisfied,
  veryDissatisfied
}

class SurveyRatioButton extends StatefulWidget {
  const SurveyRatioButton({Key? key}) : super(key: key);

  @override
  State<SurveyRatioButton> createState() => _SurveyRatioButtonState();
}

class _SurveyRatioButtonState extends State<SurveyRatioButton> {
  List selectedButton = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedButton.clear();
    for (int i = 0; i < questions1.length; i++) {
      selectedButton.add("$i");
    }
    _errorMessage = "";
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _errorMessage = "";

  void _validateInputs() {
    final form = _formKey.currentState;
    // if (form.validate()) {
    //   // Text forms has validated.
    //   // Let's validate radios and checkbox
    //   if (radioValue < 0) {
    //     // None of the radio buttons was selected
    //     _showSnackBar('Please select your gender');
    //   } else if (!_termsChecked) {
    //     // The checkbox wasn't checked
    //     _showSnackBar("Please accept our terms");
    //   } else {
    //     // Every of the data in the form are valid at this point
    //     form.save();
    //   }
    // } else {
    //   setState(() => _autoValidate = true);
    // }
  }

  bool _isButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;

    print("selectedButton at initial----> $selectedButton");
    return dw > 500
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
              key: _formKey,
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: questions1.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: i % 2 == 0
                                ? Colors.black12.withOpacity(.03)
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: dw - dw * .66,
                                child: Text(
                                  questions1[i],
                                  style: CustomTextStyle.radioHeading(context),
                                ),
                                // color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: dw * .08,
                                            child: Radio(
                                                value: FeedBackButton
                                                    .verySatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    selectedButton[i] = value!;
                                                    _errorMessage = "";

                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .08,
                                            child: Radio(
                                                value: FeedBackButton.satisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .07,
                                            child: Radio(
                                                value: FeedBackButton.neutral,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .12,
                                            child: Radio(
                                                value:
                                                    FeedBackButton.dissatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .12,
                                            child: Radio(
                                                value: FeedBackButton
                                                    .veryDissatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  Row(
                    children: [
                      SizedBox(
                        width: dw - dw * .66,
                        child: Text(
                          "${questions2[0]}",
                          style: CustomTextStyle.radioHeading(context),
                        ),
                        // color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (data) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "* Kindly fill the field";
                            }
                            // else if (data.length != 10) {
                            //   return "* Incorrect Mobile Number";
                            // }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: dw - dw * .66,
                        child: Text(
                          "${questions2[1]}",
                          style: CustomTextStyle.radioHeading(context),
                        ),
                        // color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (data) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "* Kindly fill the field";
                            }
                            // else if (data.length != 10) {
                            //   return "* Incorrect Mobile Number";
                            // }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red[700]),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool _isTextValidate = false;
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isTextValidate = true;
                          });
                        }
                        for (int i = 0; i < selectedButton.length; i++) {
                          if (selectedButton[i].toString().length > 2) {
                            print(
                                "selectedButton[$i] length --- > ${selectedButton[i].toString().length}");
                            _isButtonSelected = true;
                            continue;
                          } else {
                            print("button selection fail");
                            _isButtonSelected = false;

                            break;
                          }
                        }
                        if (_isButtonSelected && _isTextValidate) {
                          setState(() {
                            _errorMessage = "";
                            print("data verified because of radioButton");
                          });
                          print("data verified");
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Thanks for your support"),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actionsPadding: EdgeInsets.only(bottom: 10),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const LogInPage();
                                          }), (route) => false);
                                        },
                                        child: const Text("LogOut"))
                                  ],
                                );
                              });
                        } else {
                          setState(() {
                            _errorMessage =
                                "* Please provide all necessary detail";
                            print("data verified because of radioButton");
                          });
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
              key: _formKey,
              child: Column(
                children: [
                  ListView.builder(
                      // scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: questions1.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            color: i % 2 == 0
                                ? Colors.black12.withOpacity(.03)
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: dw - dw * .66,
                                child: Text(
                                  questions1[i],
                                  style: CustomTextStyle.radioHeading2(context),
                                ),
                                // color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: dw * .08,
                                            child: Radio(
                                                value: FeedBackButton
                                                    .verySatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    selectedButton[i] = value!;
                                                    _errorMessage = "";

                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .08,
                                            child: Radio(
                                                value: FeedBackButton.satisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .07,
                                            child: Radio(
                                                value: FeedBackButton.neutral,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .12,
                                            child: Radio(
                                                value:
                                                    FeedBackButton.dissatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                        SizedBox(
                                            width: dw * .12,
                                            child: Radio(
                                                value: FeedBackButton
                                                    .veryDissatisfied,
                                                groupValue: selectedButton[i],
                                                onChanged: (value) {
                                                  print("$value");
                                                  setState(() {
                                                    _errorMessage = "";

                                                    selectedButton[i] = value!;
                                                    print(
                                                        "selectedButton at initial------> $selectedButton for index of : $i");
                                                  });
                                                })),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  Row(
                    children: [
                      SizedBox(
                        width: dw - dw * .66,
                        child: Text(
                          "${questions2[0]}",
                          style: CustomTextStyle.radioHeading2(context),
                        ),
                        // color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (data) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "* Kindly fill the field";
                            }
                            // else if (data.length != 10) {
                            //   return "* Incorrect Mobile Number";
                            // }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: dw - dw * .66,
                        child: Text(
                          "${questions2[1]}",
                          style: CustomTextStyle.radioHeading2(context),
                        ),
                        // color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (data) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "* Kindly fill the field";
                            }
                            // else if (data.length != 10) {
                            //   return "* Incorrect Mobile Number";
                            // }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red[700]),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bool _isTextValidate = false;
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isTextValidate = true;
                          });
                        }
                        for (int i = 0; i < selectedButton.length; i++) {
                          if (selectedButton[i].toString().length > 2) {
                            print(
                                "selectedButton[$i] length --- > ${selectedButton[i].toString().length}");
                            _isButtonSelected = true;
                            continue;
                          } else {
                            print("button selection fail");
                            _isButtonSelected = false;

                            break;
                          }
                        }
                        if (_isButtonSelected && _isTextValidate) {
                          setState(() {
                            _errorMessage = "";
                            print("data verified because of radioButton");
                          });
                          print("data verified");
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text(
                                    "Thanks for your support",
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actionsPadding: EdgeInsets.only(bottom: 10),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const LogInPage();
                                          }), (route) => false);
                                        },
                                        child: const Text("LogOut"))
                                  ],
                                );
                              });
                        } else {
                          setState(() {
                            _errorMessage =
                                "* Please provide all necessary detail";
                            print("data verified because of radioButton");
                          });
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          );
  }
}

List questions1 = [
  "How satisfied were you with the food quality? *",
  "How satisfied were you with the food presentation? *",
  "How satisfied were you with the food portion size? *",
  "How satisfied were you with the service quality? *",
  "How satisfied were you with the friendliness of the staff? *",
  "How satisfied were you with the speed of service? *",
  "How satisfied were you with the cleanliness of the restaurant? *",
  "How likely are you to recommend this restaurant to others? *",
];

List questions2 = [
  "What could we do to improve our food and service? *",
  "Any additional comments or feedback? *"
];
