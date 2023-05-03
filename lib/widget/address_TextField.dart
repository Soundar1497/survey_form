import "package:flutter/material.dart";

class AddressTextField extends StatefulWidget {
  AddressTextField({
    Key? key,
    this.width,
    this.hintText,
    required this.controller,
    this.validator,
    this.icon,
    this.obscureText,
    this.inputType,
  }) : super(key: key);

  final double? width;
  final String? hintText;
  late bool? obscureText;

  // final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon? icon;
  final TextInputType? inputType;

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = widget.width ?? MediaQuery.of(context).size.width;
    return Container(
      width: w,
      // height: 60,
      // color: Colors.red,
      margin: const EdgeInsets.only(top: 8),
      child: TextFormField(
          onChanged: (data) {},
          textAlign: TextAlign.start,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.obscureText == true ? !passwordVisible : false,
          obscuringCharacter: "*",
          maxLines: 1,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          validator: widget.validator,
          keyboardType: widget.inputType,
          autofocus: false,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 18),
            errorMaxLines: 2,
            // isCollapsed: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 15, 0, 15),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                )),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.lightBlue,
                )),
            // label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.black.withOpacity(.7)),
            floatingLabelStyle: TextStyle(color: Colors.black.withOpacity(.3)),
            suffixIcon: widget.obscureText == false
                ? const Icon(
                    Icons.add,
                    color: Colors.transparent,
                  )
                : showPassword(),

            suffixIconConstraints:
                const BoxConstraints(minHeight: 24, minWidth: 24),
          )),
    );
  }

  Widget showPassword() {
    if (widget.obscureText == true) {
      return IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
              print("passwordVisible---> $passwordVisible");
            });
          },
          icon: Icon(
            passwordVisible == true ? Icons.visibility : Icons.visibility_off,
          ));

      //   ButtonTheme(
      //     child: TextButton(
      //   style: TextButton.styleFrom(
      //     padding: const EdgeInsets.all(0),
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       passwordVisible = !passwordVisible;
      //     });
      //   },
      //   child: TextFieldIcon(
      //     obscureText: widget.obscureText,
      //     passwordVisible: passwordVisible,
      //     icons:
      //         passwordVisible == true ? Icons.visibility : Icons.visibility_off,
      //   ),
      // ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
