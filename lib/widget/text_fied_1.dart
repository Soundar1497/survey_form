import 'package:flutter/material.dart';
import 'package:survey_form/widget/text_field_icon.dart';

class TextForm1 extends StatefulWidget {
  TextForm1({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText,
    required this.label,
    this.icon,
    this.inputType,
  }) : super(key: key);
  final String hintText;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  late bool? obscureText;
  IconData? icon;
  final TextInputType? inputType;

  @override
  State<TextForm1> createState() => _TextForm1State();
}

class _TextForm1State extends State<TextForm1> {
  @override
  Widget build(BuildContext context) {
    widget.obscureText ??= false;
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
      child: TextFormField(
        onChanged: (data) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        obscuringCharacter: "*",
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: TextStyle(color: Colors.black.withAlpha(100)),
          floatingLabelStyle: TextStyle(color: Colors.black54.withAlpha(150)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withAlpha(50)),
          suffixIcon:
              widget.obscureText == false ? Container() : showPassword(),
        ),
        //  decorations
        cursorColor: Colors.redAccent.withAlpha(25),
        style: TextStyle(color: Colors.black.withAlpha(250)),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return Container(
        width: 10,
        height: 10,
        child: ButtonTheme(
            child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          child: TextFieldIcon(
            obscureText: widget.obscureText,
            passwordVisible: passwordVisible,
            icons: passwordVisible == true
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        )),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
