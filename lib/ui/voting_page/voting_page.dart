import 'package:flutter/material.dart';
import 'package:survey_form/constant/constant.dart';
import 'package:survey_form/theme/custom_text_style.dart';
import 'package:survey_form/ui/query_list_page/query_list_page.dart';

enum FeedBackButton {
  verySatisfied,
  satisfied,
  neutral,
  dissatisfied,
  veryDissatisfied
}

class VotingPage extends StatefulWidget {
  VotingPage({Key? key, required this.votingTitle}) : super(key: key);

  String votingTitle;

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  var selectedButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // selectedButton.clear();
    // for (int i = 0; i < Constant.radioButtonText.length; i++) {
    //   selectedButton.add("$i");
    // }
  }

  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    print("dw : $dw , dh : $dh");
    var cardWidth = dw * .18;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 14,
              left: 16,
              right: 16,
            ),
            child: Container(
              // color: Colors.red,
              height: dh * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Vote",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: dw * .02,
                  ),
                  Text(
                    widget.votingTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: dw * .01,
                  ),
                  const Text(
                    "40 minutes ago",
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),

                  SizedBox(
                    height: dw * .03,
                  ),

                  const Text(
                    "Make a choice:",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: dh * .05,
                  ),
                  SizedBox(
                    width: dw,
                    // color: Colors.red,
                    height: dh * .35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // very satisfied
                        Container(
                          width: cardWidth,
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButton = Constant.radioButtonText[0];
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    Constant.emojiList[0],
                                    style: CustomTextStyle.votingIcon(context),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Radio(
                                            value: Constant.radioButtonText[0],
                                            groupValue: selectedButton,
                                            onChanged: (value) {}),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            Constant.radioButtonText[0],
                                            softWrap: true,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //  satisfied

                        Container(
                          width: cardWidth,
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButton = Constant.radioButtonText[1];
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    Constant.emojiList[1],
                                    style: CustomTextStyle.votingIcon(context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Radio(
                                          value: Constant.radioButtonText[1],
                                          groupValue: selectedButton,
                                          onChanged: (value) {}),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Constant.radioButtonText[1],
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //  neutral
                        Container(
                          width: cardWidth,
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButton = Constant.radioButtonText[2];
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    Constant.emojiList[2],
                                    style: CustomTextStyle.votingIcon(context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Radio(
                                          value: Constant.radioButtonText[2],
                                          groupValue: selectedButton,
                                          onChanged: (value) {}),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Constant.radioButtonText[2],
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //dissatisfied
                        Container(
                          width: cardWidth,
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButton = Constant.radioButtonText[3];
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    Constant.emojiList[3],
                                    style: CustomTextStyle.votingIcon(context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Radio(
                                          value: Constant.radioButtonText[3],
                                          groupValue: selectedButton,
                                          onChanged: (value) {}),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Constant.radioButtonText[3],
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //very dissatisfied

                        Container(
                          width: cardWidth,
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButton = Constant.radioButtonText[4];
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    Constant.emojiList[4],
                                    style: CustomTextStyle.votingIcon(context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Radio(
                                          value: Constant.radioButtonText[4],
                                          groupValue: selectedButton,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   selectedButton = value;
                                            // });
                                          }),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Constant.radioButtonText[4],
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  //
                  //
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //vote
                        Container(
                            width: dw * .25,
                            child: ElevatedButton(
                                onPressed: () {
                                  onTapVote(context);
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepPurple)),
                                child: const Text(
                                  "Vote",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ))),
                        SizedBox(
                          width: dw * .007,
                        ),
                        //result
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.workspace_premium_outlined,
                                  size: dw * .027,
                                ),
                                SizedBox(
                                  width: dw * .006,
                                ),
                                const Text(
                                  "Result",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: dw * .007,
                        ),
                        //share
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share_outlined,
                                  size: dw * .027,
                                ),
                                SizedBox(
                                  width: dw * .006,
                                ),
                                const Text(
                                  "Share",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: dw,
              margin: EdgeInsets.symmetric(vertical: dw * .01),
              decoration: BoxDecoration(color: Colors.grey[300]),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.lock_outline, size: 14),
                    ),
                    TextSpan(
                        text: " One vote per\n",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "browser session\n",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "allowed.",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

onTapVote(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => QueryListPage()),
      (route) => false);
}
