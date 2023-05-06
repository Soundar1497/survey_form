import 'package:flutter/material.dart';

import '../../model/query_list_model.dart';
import '../voting_page/voting_page.dart';

class QueryListContainer extends StatefulWidget {
  const QueryListContainer({Key? key}) : super(key: key);

  @override
  State<QueryListContainer> createState() => _QueryListContainerState();
}

class _QueryListContainerState extends State<QueryListContainer> {
  @override
  Widget build(BuildContext context) {
    double dw = MediaQuery.of(context).size.width;
    double dh = MediaQuery.of(context).size.height;
    return Container(
      width: dw,
      height: dh - 100,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
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
          Expanded(
            child: ListView.builder(
                itemCount: QueryListModel.questions1.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: dw,
                    height: 30,
                    margin: const EdgeInsets.symmetric(vertical: 15),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VotingPage(
                                        votingTitle:
                                            QueryListModel.questions1[i],
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: Text(QueryListModel.questions1[i].toString()),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
