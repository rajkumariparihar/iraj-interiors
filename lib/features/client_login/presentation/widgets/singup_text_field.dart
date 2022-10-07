import 'package:flutter/material.dart';

class SingupTextField extends StatefulWidget {
  String titile;
  TextEditingController controller;
  SingupTextField({Key? key, required this.titile, required this.controller})
      : super(key: key);

  @override
  _SingupTextFieldState createState() => _SingupTextFieldState();
}

class _SingupTextFieldState extends State<SingupTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: '${widget.titile}',
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
