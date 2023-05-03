import 'package:flutter/cupertino.dart';

class LogInModel {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
