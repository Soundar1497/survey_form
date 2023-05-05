import 'package:flutter/material.dart';
import 'package:survey_form/ui/query_list_page/query_list_page.dart';

class FeedBackValue extends ChangeNotifier {
  String _foodButton = "";
  String get foodButton => _foodButton;
  set foodButton(String value) {
    _foodButton = value;
    notifyListeners();
  }

  String _serviceButton = "";
  String get serviceButton => _serviceButton;
  set serviceButton(String value) {
    _serviceButton = value;
    notifyListeners();
  }

  successFeedBack(BuildContext context) {
    // print("serviceButton: $serviceButton , foodButton: $foodButton");
    var fB = foodButton.toString().length;
    var sB = serviceButton.toString().length;
    if (fB > 1 && sB > 1) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            Future.delayed(const Duration(milliseconds: 1500)).then((value) {
              foodButton = "";
              serviceButton = "";
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QueryListPage()),
                  (route) => false);
            });
            return const AlertDialog(
              title: Text(
                "Thanks for your support ...",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            );
          });
    }
  }
}
