import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../model/login_model.dart';

class LogInControl extends ControllerMVC {
  // create factory instance of _this with null function LogInControl._()
  factory LogInControl() => _this ??= LogInControl._();
  static LogInControl? _this;

  LogInControl._();

  LogInModel _logInModel = LogInModel();
  get navigatorKey => _logInModel.navigatorKey;

  TextEditingController get email => _logInModel.email;

  TextEditingController get password => _logInModel.password;


  final formKey = GlobalKey<FormState>();

}
