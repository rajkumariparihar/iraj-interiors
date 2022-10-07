import 'package:flutter/material.dart';

class SingupObsecureTextFiled extends StatefulWidget {
  String titile;
  TextEditingController controller;

  SingupObsecureTextFiled(
      {Key? key, required this.titile, required this.controller})
      : super(key: key);

  @override
  _SingupObsecureTextFiledState createState() =>
      _SingupObsecureTextFiledState();
}

class _SingupObsecureTextFiledState extends State<SingupObsecureTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: widget.titile,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
