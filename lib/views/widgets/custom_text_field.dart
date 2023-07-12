// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool isObscure;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, .25), offset: Offset(0, 4),blurRadius: 4)],
      borderRadius: BorderRadius.circular(90),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          )
        ),
        obscureText: isObscure,
        obscuringCharacter: '*',
      ),
    );
  }
}
