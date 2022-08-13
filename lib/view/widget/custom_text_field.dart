import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final IconData myicon;
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.obscureText,
      required this.controller,
      required this.myicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(myicon),
      ),
      obscureText: obscureText,
    );
  }
}
