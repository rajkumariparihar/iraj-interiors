import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/utils/cosntants.dart';

class CustomeInputFields extends StatefulWidget {
  TextEditingController controller;
  TextInputType? textInputType = TextInputType.text;
  String label;
  FormFieldValidator<String>? validator;
  Color? header_color = Constants.whiteColor;

  CustomeInputFields(
      {Key? key,
      this.header_color = Constants.whiteColor,
      required this.controller,
      required this.label,
      this.textInputType,
      this.validator})
      : super(key: key);

  @override
  _CustomeInputFieldsState createState() => _CustomeInputFieldsState();
}

class _CustomeInputFieldsState extends State<CustomeInputFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: '${widget.label}',
          labelStyle: TextStyle(color: widget.header_color)),
      controller: widget.controller,
      style: const TextStyle(fontSize: 13),
      validator: widget.validator,
      keyboardType: widget.textInputType,
    );
  }
}
