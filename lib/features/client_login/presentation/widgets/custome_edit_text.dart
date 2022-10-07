import 'package:flutter/material.dart';

import '../../../../utils/cosntants.dart';

class CustomeEditText extends StatefulWidget {
  TextEditingController textEditingController;
  String hint;
  CustomeEditText(
      {Key? key, required this.textEditingController, required this.hint})
      : super(key: key);

  @override
  _CustomeEditTextState createState() => _CustomeEditTextState();
}

class _CustomeEditTextState extends State<CustomeEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(10),
      )),
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Constants.hintColor)),
      ),
    );
  }
}
