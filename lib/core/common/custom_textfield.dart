import 'package:Xpenso/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isObscure;
  final bool isPasswordField;
  // final String type;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    // required this.type,
    this.isObscure = false,
    this.isPasswordField = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;
  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        // keyboardType: TextInputType.type,
        controller: widget.controller,
        cursorColor: AppColors.orange,
        cursorHeight: 18,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: AppColors.lightorange),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
